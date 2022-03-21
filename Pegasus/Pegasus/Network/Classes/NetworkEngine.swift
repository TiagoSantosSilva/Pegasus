//
//  NetworkEngine.swift
//  Pegasus
//
//  Created by Tiago on 09/03/2022.
//

import Foundation

protocol NetworkEnginable: AnyObject {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}

final class NetworkEngine: NetworkEnginable {

    // MARK: - Properties

    private let parser: NetworkResponseParseable

    // MARK: - Initialization

    init(parser: NetworkResponseParseable) {
        self.parser = parser
    }

    // MARK: - Functions

    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        let request = try buildRequest(for: endpoint)
        let (data, response) = try await URLSession.shared.data(for: request)
        return try parser.parse(response: response, data: data)
    }

    private func buildRequest(for endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = URLScheme.https.rawValue
        components.host = endpoint.host
        components.path = endpoint.path.appending(endpoint.endpoint)
        components.queryItems = endpoint.queryItems

        guard let url = components.url else {
            throw NetworkError.urlBuildFail
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        return request
    }
}
