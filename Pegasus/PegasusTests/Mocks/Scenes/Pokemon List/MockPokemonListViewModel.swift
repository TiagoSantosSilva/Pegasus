//
//  MockPokemonListViewModel.swift
//  PegasusTests
//
//  Created by Tiago on 09/05/2022.
//

import Foundation
@testable import Pegasus

final class MockPokemonListViewModel: PokemonListViewModelable {

    // MARK: - Properties

    var defaultChoices: RefinementChoices = Constants.Defaults.refinementChoices
    var refinementChoices: RefinementChoices = Constants.Defaults.refinementChoices
    var groups: [PokemonListGroupViewModel] = []
    var isApplyingRefinement: Bool = true
    var isOrderingForNumber: Bool = true
    var searchText: String = .empty

    // MARK: - Functions

    func loadRegions(completion: @escaping (PokemonListResult) -> Void) {
        completion(.success)
    }

    func search(for text: String) -> [PokemonListGroupViewModel] {
        []
    }

    func refine(with choices: RefinementChoices) -> [PokemonListGroupViewModel] {
        []
    }
}

// MARK: - Constants

private enum Constants {
    enum Defaults {
        static let refinementChoices: RefinementChoices = .init(order: .numberAscending,
                                                                availability: .all,
                                                                variant: .normal,
                                                                regions: RefinementRegion.allCases)
    }
}
