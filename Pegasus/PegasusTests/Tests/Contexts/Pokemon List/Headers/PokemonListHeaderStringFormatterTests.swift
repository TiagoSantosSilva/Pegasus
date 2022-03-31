//
//  PokemonListHeaderStringFormatterTests.swift
//  PegasusTests
//
//  Created by Tiago on 31/03/2022.
//

import XCTest
@testable import Pegasus

final class PokemonListHeaderStringFormatterTests: XCTestCase {

    // MARK: - Tests

    func testFormatForCountReturnsPipeWithNumberForKanto() {
        // Given

        let value = Values.kanto

        // When

        let result = PokemonListHeaderStringFormatter.format(count: value)

        // Then

        XCTAssertEqual(result, Expected.kanto)
    }

    func testFormatForCountReturnsPipeWithNumberForJohto() {
        // Given

        let value = Values.johto

        // When

        let result = PokemonListHeaderStringFormatter.format(count: value)

        // Then

        XCTAssertEqual(result, Expected.johto)
    }
}

private extension PokemonListHeaderStringFormatterTests {
    enum Values {
        static let kanto: Int = 151
        static let johto: Int = 100
    }

    enum Expected {
        static let kanto: String = " | \(Values.kanto)"
        static let johto: String = " | \(Values.johto)"
    }
}
