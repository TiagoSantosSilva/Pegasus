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
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct PokemonCellViewModel: Hashable {
    let number: String
    let name: String

    init(pokemon: Pokemon, number: Int) {
        self.number = PokemonFormatter.number(for: number)
        self.name = pokemon.name
    }
}

enum PokemonFormatter {
    static func number(for number: Int) -> String {
        "#\(String(format: "%03d", number))"
    }
}
