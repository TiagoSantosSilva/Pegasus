//
//  PokedexRegion.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

struct PokedexRegion: Hashable, Decodable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let generation: Int
    let name: String
    let pokemon: [PokedexPokemon]

    // MARK: - Coding Keys

    private enum CodingKeys: String, CodingKey {
        case generation
        case name
        case pokemon
    }

    // MARK: - Functions

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    static func == (lhs: PokedexRegion, rhs: PokedexRegion) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

struct PokedexPokemon: Hashable, Decodable {
    let number: String
    let name: String
}
