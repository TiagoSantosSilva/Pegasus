//
//  PokemonListLoader.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

protocol PokemonListLoadable {
    func loadRegions() async throws -> [PokedexRegion]
}

final class PokemonListLoader: PokemonListLoadable {

    // MARK: - Properties

    private let bundle: BundleJSONLoadable

    // MARK: - Initialization

    init(bundle: BundleJSONLoadable = Bundle.main) {
        self.bundle = bundle
    }

    // MARK: - Functions

    func loadRegions() async throws -> [PokedexRegion] {
        try bundle.json(for: .pokedex)
    }
}
