//
//  PokemonListViewModel.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

protocol PokemonListViewModelable: AnyObject {
    var pokemon: [PokemonCellViewModel] { get }

    func loadPokemon(completion: @escaping (PokemonListResult) -> Void)
}

enum PokemonListResult {
    case success
    case error
}

final class PokemonListViewModel: PokemonListViewModelable {

    // MARK: - Properties

    private(set) var pokemon: [PokemonCellViewModel] = []

    private let loader: PokemonListLoadable

    // MARK: - Initialization

    init(loader: PokemonListLoadable) {
        self.loader = loader
    }

    // MARK: - Functions

    func loadPokemon(completion: @escaping (PokemonListResult) -> Void) {
        Task {
            do {
                let result = try await loader.loadPokemon()
                self.pokemon = result.results.enumerated().compactMap {
                    PokemonCellViewModel(pokemon: $0.element, number: $0.offset)
                }
                completion(.success)
            } catch {
                completion(.error)
            }
        }
    }
}
