//
//  PokemonFormatterTests.swift
//  PegasusTests
//
//  Created by Tiago on 26/03/2022.
//

import XCTest
@testable import Pegasus

final class PokemonFormatterTests: XCTestCase {

    // MARK: - Tests

    func testNumberForSingleDigitNumberReturnsTwoLeadingZeros() {
        // Given

        // When

        let result = PokemonFormatter.number(for: Constants.singleDigit)

        // Then

        XCTAssertEqual(ExpectedFormattedResults.singleDigit, result)
    }

    func testNumberForTwoDigitNumberReturnsOneLeadingZero() {
        // Given

        // When

        let result = PokemonFormatter.number(for: Constants.twoDigit)

        // Then

        XCTAssertEqual(ExpectedFormattedResults.twoDigit, result)
    }

    func testNumberForThreeDigitNumberReturnsNoLeadingZeros() {
        // Given

        // When

        let result = PokemonFormatter.number(for: Constants.threeDigit)

        // Then

        XCTAssertEqual(ExpectedFormattedResults.threeDigit, result)
    }
}

// MARK: - Contants

private extension PokemonFormatterTests {
    enum Constants {
        static let singleDigit: Int = 6
        static let twoDigit: Int = 94
        static let threeDigit: Int = 382
    }

    enum ExpectedFormattedResults {
        static let singleDigit: String = "#006"
        static let twoDigit: String = "#094"
        static let threeDigit: String = "#382"
    }
}
