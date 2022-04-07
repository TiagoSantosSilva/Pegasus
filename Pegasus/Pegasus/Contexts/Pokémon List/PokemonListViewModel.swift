//
//  PokemonListViewModel.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

typealias PokemonListViewModelable = PokemonRegionRepresentable & PokemonListViewModelLoadable

protocol PokemonRegionRepresentable: AnyObject {
    var regions: [PokemonListHeaderViewModel] { get }
    var pokemon: [Int: [PokemonListCellViewModel]] { get }
}

protocol PokemonListViewModelLoadable: AnyObject {
    func loadRegions(completion: @escaping (PokemonListResult) -> Void)
    func search(for text: String, completion: () -> Void)
}

enum PokemonListResult {
    case success
    case error
}

final class PokemonListViewModel: PokemonListViewModelable {

    // MARK: - Properties

    var regions: [PokemonListHeaderViewModel] {
        searchStrategy.regions
    }

    var pokemon: [Int: [PokemonListCellViewModel]] {
        searchStrategy.pokemon
    }

    private let loader: PokemonListLoadable
    private let searchStrategy: PokemonListSearchStrategyable

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
                let filteredRegions = result.filter { !$0.pokemon.isEmpty }
                self.searchStrategy.regions = filteredRegions.map { PokemonListHeaderViewModel(region: $0) }
                self.searchStrategy.pokemon = Dictionary(uniqueKeysWithValues: filteredRegions.enumerated().map {
                    ($0.offset, $0.element.pokemon.map {
                        PokemonListCellViewModel(number: $0.number, name: $0.name)
                    })
                })

                completion(.success)
            } catch {
                completion(.error)
            }
        }
    }

    func search(for text: String, completion: () -> Void) {
        searchStrategy.search(for: text, completion: completion)
    }
}
