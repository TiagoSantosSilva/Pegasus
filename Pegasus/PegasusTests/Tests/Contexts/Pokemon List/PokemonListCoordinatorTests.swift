//
//  PokemonListCoordinatorTests.swift
//  PegasusTests
//
//  Created by Tiago on 31/03/2022.
//

import XCTest
@testable import Pegasus

// swiftlint:disable force_try
final class PokemonListCoordinatorTests: XCTestCase {

    // MARK: - Properties

    private var coordinator: PokemonListCoordinator!
    private var networkEngine: MockNetworkEngine!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        networkEngine = MockNetworkEngine()
        coordinator = PokemonListCoordinator(dependencies: MockDependencyContainer(networkEngine: networkEngine))
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        coordinator = nil
        networkEngine = nil
    }

    // MARK: - Tests

    func testStartHasNavigationControllerAsRoot() {
        // Given

        // When

        coordinator.start()

        // Then

        XCTAssert(coordinator.viewController is UINavigationController)
    }

    func testStartHasRootViewControllerAsPokemonListViewController() {
        // Given

        // When

        coordinator.start()

        let navigationController = try! XCTUnwrap(coordinator.viewController as? UINavigationController)
        let viewController = try! XCTUnwrap(navigationController.viewControllers.first)

        // Then

        XCTAssert(viewController is PokemonListViewController)
    }
}
