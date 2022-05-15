//
//  PokemonListCollectionViewControllerTests.swift
//  PegasusTests
//
//  Created by Tiago on 09/05/2022.
//

import SnapshotTesting
import XCTest
@testable import Pegasus

final class PokemonListCollectionViewControllerTests: XCTestCase {

    // MARK: - Properties

    private var collectionViewController: PokemonListCollectionViewController!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()
        collectionViewController = .init()
    }

    override func tearDown() {
        super.tearDown()
        collectionViewController = nil
    }

    // MARK: - Tests

    @MainActor func testCollectionViewController() {
        let pokemons: [PokemonListCellViewModel] = [.bulbasaur, .charmander, .squirtle, .dratini, .dragonair, .dragonite]
        let groups: [PokemonListGroupViewModel] = [.init(region: .kanto, pokemon: pokemons)]
        collectionViewController.update(with: groups)

        sleep(5)

        assertSnapshot(matching: collectionViewController, as: .image)
    }
}
