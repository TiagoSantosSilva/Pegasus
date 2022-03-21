//
//  NetworkResponseParser.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

protocol NetworkResponseParseable: AnyObject {
    func parse<T: Decodable>(response: URLResponse, data: Data) throws -> T
}

final class NetworkResponseParser: NetworkResponseParseable {

    // MARK: - Properties

    private lazy var decoder = JSONDecoder()

    // MARK: - Initialization

    init() { }

    // MARK: - Internal Functions

    func parse<T: Decodable>(response: URLResponse, data: Data) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.urlBuildFail
        }

        guard isResponseSuccessful(response) else { throw NetworkError.noData }
        return try decoder.decode(T.self, from: data)
    }

    // MARK: - Private Functions

    private func isResponseSuccessful(_ response: HTTPURLResponse) -> Bool {
        switch response.statusCode {
        case ResponseCodes.successful:
            return true
        default:
            return false
        }
    }
}

private extension NetworkResponseParser {
    enum ResponseCodes {
        static let successful: ClosedRange<Int> = 200...299
        static let redirection: ClosedRange<Int> = 300...399
        static let clientError: ClosedRange<Int> = 400...499
        static let serverError: ClosedRange<Int> = 500...599
    }
}
