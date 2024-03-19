//
//  Endpoint.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

protocol EndPoint {
    var host: String { get }
    var scheme: String { get }
    var pathTemplate: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParams: [String: String]? { get }
    var pathParams: [String: String]? { get }

    // Function to generate the actual path
    func actualPath() -> String
}
