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

    func isEqual(to other: [PokemonListGroupViewModel]) -> Bool {
        zip(self, other).allSatisfy { group, otherGroup in
            group.isEqual(to: otherGroup)
        }
    }
}
