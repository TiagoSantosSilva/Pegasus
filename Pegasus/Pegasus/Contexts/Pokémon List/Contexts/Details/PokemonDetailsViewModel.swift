//
//  PokemonDetailsViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

protocol PokemonDetailsDataRepresentable: AnyObject {
    var name: String { get }
}

typealias PokemonDetailsViewModelable = PokemonDetailsDataRepresentable

final class PokemonDetailsViewModel: PokemonDetailsViewModelable {

    // MARK: - Properties

    let name: String

    private let pokemon: PokemonListCellViewModel

    // MARK: - Initialization

    init(pokemon: PokemonListCellViewModel) {
        self.pokemon = pokemon
        self.name = pokemon.name
    }
}
