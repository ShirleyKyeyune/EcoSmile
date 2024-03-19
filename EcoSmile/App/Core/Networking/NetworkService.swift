//
//  NetworkService.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

final class NetworkService: Networkable {
    init() {}

    func sendRequest<T: Decodable>(endpoint: EndPoint) async throws -> T {
        guard let urlRequest = createRequest(endPoint: endpoint) else {
            log("Invalid request", level: .error)
            throw NetworkError.invalidRequest
        }
        log("Sending request to \(urlRequest.url?.absoluteString ?? "unknown URL")", level: .info)

        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
                .dataTask(with: urlRequest) { data, response, error in
                    if let error = error {
                        log("Request failed: \(error.localizedDescription)", level: .error)
                        continuation.resume(throwing: NetworkError.networkFailure(error))
                        return
                    }

                    guard let response = response as? HTTPURLResponse else {
                        log("Invalid response", level: .error)
                        continuation.resume(throwing: NetworkError.invalidResponse)
                        return
                    }

                    guard 200 ... 299 ~= response.statusCode else {
                        log("Unexpected status code: \(response.statusCode)", level: .warning)
                        continuation.resume(throwing: NetworkError.unexpectedStatusCode(response.statusCode))
                        return
                    }

                    guard let data = data else {
                        log("Invalid data", level: .error)
                        continuation.resume(throwing: NetworkError.invalidData)
                        return
                    }

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let decodedResponse = try decoder.decode(T.self, from: data)
                        log("Request succeeded with decoded DTO", level: .info)
                        continuation.resume(returning: decodedResponse)
                    } catch {
                        log("Failed to decode response: \(error.localizedDescription)", level: .error)
                        continuation.resume(throwing: NetworkError.decodeInvalidData)
                    }
                }
            task.resume()
        }
    }
}

extension Networkable {
    fileprivate func createRequest(endPoint: EndPoint) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.actualPath()
        guard let url = urlComponents.url else {
            log("Failed to create URL from components", level: .error)
            return nil
        }
        let encoder = JSONEncoder()
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header
        if let body = endPoint.body {
            request.httpBody = try? encoder.encode(body)
        }
        log("Request created: \(request)", level: .info)
        return request
    }
}
