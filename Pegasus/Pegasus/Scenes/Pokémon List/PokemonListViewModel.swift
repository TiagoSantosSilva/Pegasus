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
    var isApplyingRefinement: Bool { get }
    var isOrderingForNumber: Bool { get }
    var defaultChoices: RefinementChoices { get }
    var refinementChoices: RefinementChoices { get }

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

    let defaultChoices: RefinementChoices = Constants.Defaults.refinementChoices

    var isApplyingRefinement: Bool {
        refinementChoices != Constants.Defaults.refinementChoices
    }

    private(set) var groups: [PokemonListGroupViewModel] = []
    private(set) var isOrderingForNumber: Bool = true
    private(set) var refinementChoices: RefinementChoices = Constants.Defaults.refinementChoices
    private(set) var searchedText: String = .empty

    // MARK: - Properties

    private let loader: PokemonListLoadable
    private let orderStrategy: PokemonListOrderStrategyable
    private let regionStrategy: PokemonListRegionStrategiable
    private let searchStrategy: PokemonListSearchStrategyable

    private var allGroups: [PokemonListGroupViewModel] = []
    private lazy var nonSearchedGroups: [PokemonListGroupViewModel] = allGroups

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

    func refine(with choices: RefinementChoices) -> [PokemonListGroupViewModel] {
        refinementChoices = choices

        /// Order
        groups = orderStrategy.order(groups: allGroups, by: choices.order)
        assertVariables(for: choices.order)

        /// Region
        let filteredGroups = filterForRegion(in: groups, using: choices.regions)
        groups = searchStrategy.search(for: searchedText, in: filteredGroups)

        /// Variant
        groups.configure(for: variant(from: choices.variant))

        nonSearchedGroups = filteredGroups
        return groups
    }

    func search(for text: String) -> [PokemonListGroupViewModel] {
        searchedText = text
        groups = searchStrategy.search(for: text, in: nonSearchedGroups)
        return groups
    }

    // MARK: - Private Functions

    private func assertVariables(for order: RefinementOrder) {
        isOrderingForNumber = order == .numberAscending || order == .numberDescending
    }

    private func filterForRegion(in groups: [PokemonListGroupViewModel], using regions: [RefinementRegion]) -> [PokemonListGroupViewModel] {
        guard isOrderingForNumber else { return groups }
        return regionStrategy.regions(in: groups, using: regions)
    }

    private func groups(for regions: [PokedexRegion]) -> [PokemonListGroupViewModel] {
        let filteredRegions = regions.filter { !$0.pokemon.isEmpty }
        return filteredRegions.map {
            let region = PokemonListHeaderViewModel(name: $0.name, number: $0.generation, pokemonCount: $0.pokemon.count)
            let pokemon = $0.pokemon.map { PokemonListCellViewModel(number: $0.number, name: $0.name) }
            return PokemonListGroupViewModel(region: region, pokemon: pokemon)
        }
    }

    private func variant(from refinementVariant: RefinementVariant) -> PokemonListCellViewModelImageVariant {
        PokemonListCellViewModelImageVariant(from: refinementVariant)
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
