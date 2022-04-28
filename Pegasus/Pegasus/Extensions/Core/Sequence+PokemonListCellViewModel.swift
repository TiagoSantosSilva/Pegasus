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

    func isEqual(to other: [PokemonListCellViewModel]) -> Bool {
        zip(self, other).allSatisfy { viewModel, otherViewModel in
            print("\(viewModel.name) \(otherViewModel.name)")
            return viewModel.isEqual(to: otherViewModel)
        }
    }
}
