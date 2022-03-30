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

    private let networkEngine: NetworkEnginable

    // MARK: - Initialization

    init(networkEngine: NetworkEnginable) {
        self.networkEngine = networkEngine
    }

    // MARK: - Functions

    func loadRegions() async throws -> [PokedexRegion] {
        try Bundle.json(for: .pokedex)
    }
}

enum JSONContent: String {
    case pokedex
}

extension Bundle {
    static func json<T: Decodable>(for content: JSONContent) throws -> T {
        guard let path = Bundle.main.path(forResource: content.rawValue, ofType: "json") else { throw NetworkError.noData }
        let content = try String(contentsOfFile: path)
        return try JSONDecoder().decode(T.self, from: Data(content.utf8))
    }
}
