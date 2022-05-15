//
//  PokemonListViewControllerTests.swift
//  PegasusTests
//
//  Created by Tiago on 09/05/2022.
//

import SnapshotTesting
import XCTest
@testable import Pegasus

final class PokemonListViewControllerTests: XCTestCase {

    // MARK: - Properties

    private var collectionViewController: PokemonListCollectionViewController!
    private var searchController: PokemonListSearchController!
    private var viewController: PokemonListViewController!
    private var viewModel: MockPokemonListViewModel!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()
        collectionViewController = PokemonListCollectionViewController()
        searchController = PokemonListSearchController(searchResultsController: nil)
        viewModel = MockPokemonListViewModel()
        viewController = PokemonListViewController(collectionViewController: collectionViewController,
                                                   searchController: searchController,
                                                   viewModel: viewModel)
    }

    override func tearDown() {
        super.tearDown()
        collectionViewController = nil
        searchController = nil
        viewModel = nil
        viewController = nil
    }

    // MARK: - Tests

    func testViewController() {
        assertSnapshot(matching: viewController, as: .image)
    }
}
