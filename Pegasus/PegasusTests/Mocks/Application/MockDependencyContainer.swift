//
//  MockDependencyContainer.swift
//  PegasusTests
//
//  Created by Tiago on 31/03/2022.
//

import Foundation
@testable import Pegasus

final class MockDependencyContainer: DependencyContainable {

    // MARK: - Properties

    let networkEngine: NetworkEnginable

    // MARK: - Initialization

    init(networkEngine: NetworkEnginable = MockNetworkEngine()) {
        self.networkEngine = networkEngine
    }
}
