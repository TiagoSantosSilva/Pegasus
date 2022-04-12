//
//  PokemonListHeaderStringFormatter.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

enum PokemonListHeaderStringFormatter {

    // MARK: - Functions

    static func format(count: Int) -> String {
        " | \(count)"
    }
}
