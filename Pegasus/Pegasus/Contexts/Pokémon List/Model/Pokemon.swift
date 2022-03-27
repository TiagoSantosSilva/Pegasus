//
//  Pokemon.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

struct PokemonListRequestResult: Decodable {
    let count: Int
    let nextURL: String?
    let previousURL: String?
    let results: [PokemonListPokemon]
}

struct PokemonListPokemon: Decodable {
    let name: String
    let url: String
}

struct Region: Hashable, Decodable {
    let uuid: UUID = UUID()

    let name: String
    let pokemon: [Pokemon]

    private enum CodingKeys: String, CodingKey {
        case name
        case pokemon
    }

    static func == (lhs: Region, rhs: Region) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

struct Pokemon: Hashable, Decodable {
    let number: String
    let name: String
}

struct PokemonCellViewModel: Hashable {
    let number: String
    let name: String

    init(number: String, name: String) {
        self.number = number
        self.name = name
    }
}

enum PokemonFormatter {
    static func number(for number: Int) -> String {
        "#\(String(format: "%03d", number))"
    }
}
