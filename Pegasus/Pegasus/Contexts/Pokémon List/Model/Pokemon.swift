//
//  Pokemon.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

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

enum PokemonFormatter {
    static func number(for number: Int) -> String {
        "#\(String(format: "%03d", number))"
    }
}
