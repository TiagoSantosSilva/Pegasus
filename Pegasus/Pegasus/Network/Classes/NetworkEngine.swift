//
//  NetworkEngine.swift
//  Pegasus
//
//  Created by Tiago on 09/03/2022.
//

import Foundation

protocol NetworkEnginable: AnyObject {
    func request(endpoint: Endpoint) async throws -> Data
}

final class NetworkEngine: NetworkEnginable {

    // MARK: - Functions

    func request(endpoint: Endpoint) async throws -> Data {
        let request = try buildRequest(for: endpoint)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.urlBuildFail
        }

        //        print("☃️ Data: \(data) \nResponse: \(response.statusCode)")
        return data
    }

    private func buildRequest(for endpoint: Endpoint) throws -> URLRequest {
        guard let url = URL(string: endpoint.baseURL) else {
            throw NetworkError.urlBuildFail
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkError.urlBuildFail
        }

        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2/pokemon"
        request.url = components.url
        return request
    }
}
