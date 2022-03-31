//
//  PokemonListHeaderViewModelTests.swift
//  PegasusTests
//
//  Created by Tiago on 31/03/2022.
//

import XCTest
@testable import Pegasus

final class PokemonListHeaderViewModelTests: XCTestCase {

    // MARK: - Tests

    func testInitForKanto() {
        // Given

        let region = Values.Regions.kanto

        // When

        let viewModel = PokemonListHeaderViewModel(region: region)

        // Then

        XCTAssertEqual(viewModel.name.string, Expected.Names.kanto)
    }

    func testInitForJohto() {
        // Given

        let region = Values.Regions.johto

        // When

        let viewModel = PokemonListHeaderViewModel(region: region)

        // Then

        XCTAssertEqual(viewModel.name.string, Expected.Names.johto)
    }
}

// MARK: - Constants

private extension PokemonListHeaderViewModelTests {
    enum Values {
        enum Count {
            static let kanto: Int = 151
            static let johto: Int = 100
        }

        enum Regions {
            static let kanto: PokedexRegion = .init(name: "Kanto", pokemon: Array(repeating: PokedexPokemon(number: "001", name: "Bulbasaur"), count: Count.kanto))
            static let johto: PokedexRegion = .init(name: "Johto", pokemon: Array(repeating: PokedexPokemon(number: "152", name: "Chikorita"), count: Count.johto))
        }
    }

    enum Expected {
        enum Names {
            static let kanto: String = "Kanto | \(Values.Count.kanto)"
            static let johto: String = "Johto | \(Values.Count.johto)"
        }
    }
}
