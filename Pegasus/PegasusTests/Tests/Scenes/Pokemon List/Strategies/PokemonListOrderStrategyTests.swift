//
//  PokemonListOrderStrategyTests.swift
//  PegasusTests
//
//  Created by Tiago on 30/04/2022.
//

import XCTest
@testable import Pegasus

final class PokemonListOrderStrategyTests: XCTestCase {

    // MARK: - Properties

    private var strategy: PokemonListOrderStrategy!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()
        strategy = PokemonListOrderStrategy()
    }

    override func tearDown() {
        super.tearDown()
        strategy = nil
    }

    // MARK: - Tests

    func testNameAscending() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.johto, .kanto]
        let expectedResult: [PokemonListGroupViewModel] = [.init(region: .none, pokemon: [.bulbasaur, .charmander, .chikorita, .cyndaquill, .squirtle, .totodile])]

        // When

        let result = strategy.order(groups: groups, by: .nameAscending)

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }

    func testNameDescending() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.johto, .kanto]
        let expectedResult: [PokemonListGroupViewModel] = [.init(region: .none, pokemon: [.totodile, .squirtle, .cyndaquill, .chikorita, .charmander, .bulbasaur])]

        // When

        let result = strategy.order(groups: groups, by: .nameDescending)

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }

    func testNumberAscending() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.hoenn, .kanto]
        let expectedResult: [PokemonListGroupViewModel] = [.init(region: .kanto, pokemon: [.bulbasaur, .charmander, .squirtle]),
                                                           .init(region: .hoenn, pokemon: [.treecko, .torchic, .mudkip])]

        // When

        let result = strategy.order(groups: groups, by: .numberAscending)

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }

    func testNumberDescending() {
        // Given

        let groups: [PokemonListGroupViewModel] = [.hoenn, .kanto]
        let expectedResult: [PokemonListGroupViewModel] = [.init(region: .hoenn, pokemon: [.mudkip, .torchic, .treecko]),
                                                           .init(region: .kanto, pokemon: [.squirtle, .charmander, .bulbasaur])]

        // When

        let result = strategy.order(groups: groups, by: .numberDescending)

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }
}
