//
//  BaseEndpoint.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

private enum HTTPHeader {
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let acceptEncoding = "Accept-Encoding"
    static let contentEncoding = "Content-Encoding"
    static let cacheControl = "Cache-Control"
    static let authorization = "Authorization"
}

class BaseEndpoint: EndPoint {
    let environment: APIEnvironment

    private var headers: [String: String] = [
        HTTPHeader.accept: "application/json",
        HTTPHeader.contentType: "application/json",
        HTTPHeader.acceptEncoding: "gzip, deflate, br",
        HTTPHeader.cacheControl: "no-cache",
        HTTPHeader.contentEncoding: "utf-8"
    ]

    init(environment: APIEnvironment) {
        self.environment = environment
    }

    var scheme: String {
        environment.scheme
    }

    var host: String {
        environment.host
    }

    var pathTemplate: String {
        "/api/v2/pokemon"
    }

    var method: RequestMethod {
        .get
    }

    var header: [String: String]? {
        headers
    }

    var body: [String: String]? {
        nil
    }

    var queryParams: [String: String]? {
        nil
    }

    var pathParams: [String: String]? {
        nil
    }

    func actualPath() -> String {
        var actualPath = pathTemplate
        pathParams?.forEach { key, value in
            actualPath = actualPath.replacingOccurrences(of: "{\(key)}", with: value)
        }
        return actualPath
    }

    func setHeader(_ value: String, forKey key: String) {
        headers[key] = value
    }
}
