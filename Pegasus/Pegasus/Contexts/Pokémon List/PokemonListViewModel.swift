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
}

enum PokemonListResult {
    case success
    case error
}

final class PokemonListViewModel: PokemonListViewModelable {

    // MARK: - Properties

    private(set) var regions: [PokemonListHeaderViewModel] = []
    private(set) var pokemon: [Int: [PokemonListCellViewModel]] = [:]

    private let loader: PokemonListLoadable

    // MARK: - Initialization

    init(loader: PokemonListLoadable) {
        self.loader = loader
    }

    // MARK: - Functions

    func loadRegions(completion: @escaping (PokemonListResult) -> Void) {
        Task {
            do {
                let result = try await loader.loadRegions()
                let filteredRegions = result.filter { !$0.pokemon.isEmpty }
                self.regions = filteredRegions.map { PokemonListHeaderViewModel(region: $0) }
                self.pokemon = Dictionary(uniqueKeysWithValues: filteredRegions.enumerated().map {
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
}
