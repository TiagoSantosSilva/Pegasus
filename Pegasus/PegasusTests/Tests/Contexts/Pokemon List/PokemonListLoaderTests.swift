//
//  PokemonListLoaderTests.swift
//  PegasusTests
//
//  Created by Tiago on 31/03/2022.
//

import XCTest
@testable import Pegasus

final class PokemonListLoaderTests: XCTestCase {

    // MARK: - Properties

    private var bundle: MockBundle!
    private var loader: PokemonListLoader!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()
        bundle = MockBundle()
        loader = PokemonListLoader(bundle: bundle)
    }

    override func tearDown() {
        super.tearDown()
        loader = nil
        bundle = nil
    }

    // MARK: - Tests

    func testLoadRegionsLoadsRegionsFromBundleForKantoAndJohto() async throws {
        // Given

        bundle.handler = { _ in
            Constants.kantoAndJohto
        }

        // When

        let data = try await self.loader.loadRegions()

        // Then

        XCTAssertEqual(data, Constants.kantoAndJohto)
    }

    func testLoadRegionsLoadsRegionsFromBundleForHoennAndSinnoh() async throws {
        // Given

        bundle.handler = { _ in
            Constants.hoennAndSinnoh
        }

        // When

        let data = try await self.loader.loadRegions()

        // Then

        XCTAssertEqual(data, Constants.hoennAndSinnoh)
    }
}

// MARK: - Constants

private enum Constants {
    static let kantoAndJohto: [PokedexRegion] = [.kanto, .johto]
    static let hoennAndSinnoh: [PokedexRegion] = [.hoenn, .sinnoh]
}
