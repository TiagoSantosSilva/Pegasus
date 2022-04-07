//
//  PokemonListViewModel.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

typealias PokemonListViewModelable = PokemonRegionRepresentable & PokemonListViewModelLoadable

protocol PokemonRegionRepresentable: AnyObject {
    var groups: [PokemonListGroupViewModel] { get }
}

protocol PokemonListViewModelLoadable: AnyObject {
    func loadRegions(completion: @escaping (PokemonListResult) -> Void)
    func search(for text: String, completion: ([PokemonListGroupViewModel]) -> Void)
}

enum PokemonListResult {
    case success
    case error
}

final class PokemonListViewModel: PokemonListViewModelable {

    // MARK: - Internal

    var groups: [PokemonListGroupViewModel] = []

    // MARK: - Properties

    private let loader: PokemonListLoadable
    private let searchStrategy: PokemonListSearchStrategyable

    private var allGroups: [PokemonListGroupViewModel] = []

    // MARK: - Initialization

    init(loader: PokemonListLoadable, searchStrategy: PokemonListSearchStrategyable) {
        self.loader = loader
        self.searchStrategy = searchStrategy
    }

    // MARK: - Functions

    func loadRegions(completion: @escaping (PokemonListResult) -> Void) {
        Task {
            do {
                let result = try await loader.loadRegions()
                let groups = groups(for: result)
                self.groups = groups
                self.allGroups = groups

                completion(.success)
            } catch {
                completion(.error)
            }
        }
    }

    func search(for text: String, completion: ([PokemonListGroupViewModel]) -> Void) {
        searchStrategy.search(for: text, in: allGroups) { [unowned self] in
            self.groups = $0
            completion($0)
        }
    }

    // MARK: - Private Functions

    private func groups(for regions: [PokedexRegion]) -> [PokemonListGroupViewModel] {
        let filteredRegions = regions.filter { !$0.pokemon.isEmpty }
        return filteredRegions.map {
            let region = PokemonListHeaderViewModel(name: $0.name, pokemonCount: $0.pokemon.count)
            let pokemon = $0.pokemon.map { PokemonListCellViewModel(number: $0.number, name: $0.name) }
            return PokemonListGroupViewModel(region: region, pokemon: pokemon)
        }
    }
}
