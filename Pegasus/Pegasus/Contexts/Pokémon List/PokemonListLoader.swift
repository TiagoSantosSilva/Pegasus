//
//  PokemonListLoader.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

protocol PokemonListLoadable {
    func loadPokemon() async throws -> PokemonListRequestResult
}

final class PokemonListLoader: PokemonListLoadable {

    // MARK: - Properties

    private let networkEngine: NetworkEnginable

    // MARK: - Initialization

    init(networkEngine: NetworkEnginable) {
        self.networkEngine = networkEngine
    }

    // MARK: - Functions

    func loadPokemon() async throws -> PokemonListRequestResult {
        let result = try await networkEngine.request(endpoint: PokemonEndpoint.list(offset: .zero, limit: 1200)) as PokemonListRequestResult
        return result
    }
}
