//
//  PokemonListGroupViewModel.swift
//  Pegasus
//
//  Created by Tiago on 07/04/2022.
//

import Foundation

final class PokemonListGroupViewModel {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let region: PokemonListHeaderViewModel
    let pokemon: [PokemonListCellViewModel]

    // MARK: - Initialization

    init(region: PokemonListHeaderViewModel, pokemon: [PokemonListCellViewModel]) {
        self.region = region
        self.pokemon = pokemon
    }
}

// MARK: - Hashable

extension PokemonListGroupViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    static func == (lhs: PokemonListGroupViewModel, rhs: PokemonListGroupViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
