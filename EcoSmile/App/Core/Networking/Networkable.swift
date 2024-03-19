//
//  Networkable.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

protocol Networkable {
    func sendRequest<T: Decodable>(endpoint: EndPoint) async throws -> T
}
