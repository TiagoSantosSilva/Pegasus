//
//  PokemonListSearchStrategyTests.swift
//  PegasusTests
//
//  Created by Tiago on 28/04/2022.
//

import XCTest
@testable import Pegasus

final class PokemonListSearchStrategyTests: XCTestCase {

    // MARK: - Properties

    private var strategy: PokemonListSearchStrategy!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()
        strategy = PokemonListSearchStrategy()
    }

    override func tearDown() {
        super.tearDown()
        strategy = nil
    }

    // MARK: - Tests

    func testSearchForEmptyTextReturnsAllPokemon() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.kanto, .johto]

        // When

        let result = strategy.search(for: .empty, in: groups)

        // Then

        XCTAssertEqual(result, groups)
    }

    func testSearchForEmptyTextReturnsNoGroupsForTextWithNoResults() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.kanto, .johto]

        // When

        let result = strategy.search(for: Constants.NoResult.string, in: groups)
        let expectedResult: [PokemonListGroupViewModel] = []

        // Then

        XCTAssertEqual(result, expectedResult)
    }

    func testSearchForTextWithPokemonContainingTextInNameReturnsGroupsWithPokemon() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.kanto.appending(.dratini, .dragonair, .dragonite),
                                                   .johto]

        // When

        let result = strategy.search(for: Constants.AvailablePokemonThreeLetters.string, in: groups)
        let expectedResult = [Constants.AvailablePokemonThreeLetters.expectedResult]

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }

    func testSearchForSpecificPokemonReturnsGroupAlongsideOnlyTheSearchedPokemon() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.kanto.appending(.dratini, .dragonair, .dragonite),
                                                   .johto]

        // When

        let result = strategy.search(for: Constants.SpecificPokemon.string, in: groups)
        let expectedResult = [Constants.SpecificPokemon.expectedResult]

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }
}

// MARK: - Constants

private enum Constants {
    enum NoResult {
        static let string = "iugeubwn"
    }

    enum AvailablePokemonThreeLetters {
        static let string =  "dra"
        static let expectedResult = PokemonListGroupViewModel(region: PokemonListHeaderViewModel(name: "Kanto", number: 1, pokemonCount: 3), pokemon: [.dratini, .dragonair, .dragonite])
    }

    enum SpecificPokemon {
        static let string = "Dratini"
        static let expectedResult = PokemonListGroupViewModel(region: PokemonListHeaderViewModel(name: "Kanto", number: 1, pokemonCount: 1), pokemon: [.dratini])
    }
}
