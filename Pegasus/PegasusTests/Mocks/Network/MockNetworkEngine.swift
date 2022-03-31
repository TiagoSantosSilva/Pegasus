//
//  MockNetworkEngine.swift
//  PegasusTests
//
//  Created by Tiago on 31/03/2022.
//

import Foundation
@testable import Pegasus

final class MockNetworkEngine: NetworkEnginable {

    // MARK: - Properties

    var requestHandler: ((Endpoint) -> Decodable)?

    // MARK: - Functions
    
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let handler = requestHandler, let decodable = handler(endpoint) as? T else {
            fatalError()
        }

        return decodable
    }
}
