//
//  Sequence+PokemonListGroupViewModel.swift
//  Pegasus
//
//  Created by Tiago on 28/04/2022.
//

import Foundation

extension Sequence where Element == PokemonListGroupViewModel {
    func configure(for variant: PokemonListCellViewModelImageVariant) {
        forEach { $0.pokemon.configure(for: variant) }
    }
}
