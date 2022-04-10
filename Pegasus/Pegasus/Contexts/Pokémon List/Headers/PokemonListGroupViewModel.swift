//
//  PokemonListGroupViewModel.swift
//  Pegasus
//
//  Created by Tiago on 07/04/2022.
//

import Foundation

final class PokemonListGroupViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let region: PokemonListHeaderViewModel
    let pokemon: [PokemonListCellViewModel]

    // MARK: - Initialization

    init(region: PokemonListHeaderViewModel, pokemon: [PokemonListCellViewModel]) {
        self.region = region
        self.pokemon = pokemon
    }

    // MARK: - Functions

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: PokemonListGroupViewModel, rhs: PokemonListGroupViewModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
