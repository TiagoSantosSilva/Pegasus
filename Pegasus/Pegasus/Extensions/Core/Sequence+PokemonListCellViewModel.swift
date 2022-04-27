//
//  Sequence+PokemonListCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 28/04/2022.
//

import Foundation

extension Sequence where Element == PokemonListCellViewModel {
    func configure(for variant: PokemonListCellViewModelImageVariant) {
        forEach { $0.configure(for: variant) }
    }
}
