//
//  PokemonListViewModel.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

typealias PokemonListViewModelable = PokemonListViewModelContentable & PokemonListViewModelLoadable

protocol PokemonListViewModelContentable: AnyObject {
    var groups: [PokemonListGroupViewModel] { get }
}

protocol PokemonListViewModelLoadable {
    var isOrderingForNumber: Bool { get }

    func loadRegions(completion: @escaping (PokemonListResult) -> Void)
    func search(for text: String) -> [PokemonListGroupViewModel]
    func refine(with choices: RefinementChoices) -> [PokemonListGroupViewModel]
}

enum PokemonListResult {
    case success
    case error
}

final class PokemonListViewModel: PokemonListViewModelable {

    // MARK: - Internal

    private(set) var groups: [PokemonListGroupViewModel] = []
    private(set) var isOrderingForNumber: Bool = true

    // MARK: - Properties

    private let loader: PokemonListLoadable
    private let orderStrategy: PokemonListOrderStrategyable
    private let regionStrategy: PokemonListRegionStrategiable
    private let searchStrategy: PokemonListSearchStrategyable

    private var allGroups: [PokemonListGroupViewModel] = []

    // MARK: - Initialization

    init(loader: PokemonListLoadable,
         orderStrategy: PokemonListOrderStrategyable,
         regionStrategy: PokemonListRegionStrategiable,
         searchStrategy: PokemonListSearchStrategyable) {
        self.loader = loader
        self.orderStrategy = orderStrategy
        self.regionStrategy = regionStrategy
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

    func search(for text: String) -> [PokemonListGroupViewModel] {
        groups = searchStrategy.search(for: text, in: allGroups)
        return groups
    }

    func refine(with choices: RefinementChoices) -> [PokemonListGroupViewModel] {
        groups = orderStrategy.order(groups: allGroups, by: choices.order)
        assertVariables(for: choices.order)

        groups = regionStrategy.regions(in: groups, using: choices.regions)
        return groups
    }

    // MARK: - Private Functions

    private func assertVariables(for order: RefinementOrder) {
        isOrderingForNumber = order == .numberAscending || order == .numberDescending
    }

    private func groups(for regions: [PokedexRegion]) -> [PokemonListGroupViewModel] {
        let filteredRegions = regions.filter { !$0.pokemon.isEmpty }
        return filteredRegions.map {
            let region = PokemonListHeaderViewModel(name: $0.name, number: $0.generation, pokemonCount: $0.pokemon.count)
            let pokemon = $0.pokemon.map { PokemonListCellViewModel(number: $0.number, name: $0.name) }
            return PokemonListGroupViewModel(region: region, pokemon: pokemon)
        }
    }
}
