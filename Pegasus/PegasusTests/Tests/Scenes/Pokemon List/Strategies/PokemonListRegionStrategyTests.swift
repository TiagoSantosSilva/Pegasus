//
//  PokemonListRegionStrategyTests.swift
//  PegasusTests
//
//  Created by Tiago on 30/04/2022.
//

import XCTest
@testable import Pegasus

final class PokemonListRegionStrategyTests: XCTestCase {

    // MARK: - Properties

    private var strategy: PokemonListRegionStrategy!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()
        strategy = PokemonListRegionStrategy()
    }

    override func tearDown() {
        super.tearDown()
        strategy = nil
    }

    // MARK: - Tests

    func testRegionsForOneSelectedRegionReturnsOnlyThatRegion() {
        // Given

        let groups = Constants.groups
        let selectedRegions: [RefinementRegion] = [.johto]
        let expectedResult: [PokemonListGroupViewModel] = [.johto]

        // When

        let result = strategy.regions(in: groups, using: selectedRegions)

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }

    func testRegionsForTwoSelectedRegionsReturnsOnlyThoseRegions() {
        // Given

        let groups = Constants.groups
        let selectedRegions: [RefinementRegion] = [.johto, .hoenn]
        let expectedResult: [PokemonListGroupViewModel] = [.johto, .hoenn]

        // When

        let result = strategy.regions(in: groups, using: selectedRegions)

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }

    func testRegionsForZeroSelectedRegionsReturnsNoRegions() {
        // Given

        let groups = Constants.groups
        let selectedRegions: [RefinementRegion] = []
        let expectedResult: [PokemonListGroupViewModel] = []

        // When

        let result = strategy.regions(in: groups, using: selectedRegions)

        // Then

        XCTAssert(result.isEqual(to: expectedResult))
    }
}

// MARK: - Constants

private extension PokemonListRegionStrategyTests {
    enum Constants {
        static let groups: [PokemonListGroupViewModel] = [.kanto, .johto, .hoenn]
    }
}
