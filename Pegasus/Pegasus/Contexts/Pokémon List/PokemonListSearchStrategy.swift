//
//  PokemonListSearchStrategy.swift
//  Pegasus
//
//  Created by Tiago on 07/04/2022.
//

import Foundation

protocol PokemonListSearchStrategyable: AnyObject {
    var regions: [PokemonListHeaderViewModel] { get set }
    var pokemon: [Int: [PokemonListCellViewModel]] { get set }

    func search(for text: String, completion: () -> Void)
}

final class PokemonListSearchStrategy: PokemonListSearchStrategyable {

    // MARK: - Internal Properties

    var pokemon: [Int: [PokemonListCellViewModel]] {
        get {
            searchText.isEmpty ? unfilteredPokemon : filteredPokemon
        }
        set {
            unfilteredPokemon = newValue
        }
    }

    var regions: [PokemonListHeaderViewModel] {
        get {
            searchText.isEmpty ? unfilteredRegions : filteredRegions
        }
        set {
            unfilteredRegions = newValue
        }
    }

    // MARK: - Private Properties

    private var searchText: String = .empty

    private var filteredRegions: [PokemonListHeaderViewModel] = []
    private var unfilteredRegions: [PokemonListHeaderViewModel] = []

    private var filteredPokemon: [Int: [PokemonListCellViewModel]] = [:]
    private var unfilteredPokemon: [Int: [PokemonListCellViewModel]] = [:]

    // MARK: - Functions

    func search(for text: String, completion: () -> Void) {
        self.searchText = text
        let filteredPokemonNotCompactedWithoutEmptyKeys = Dictionary(uniqueKeysWithValues: unfilteredPokemon.compactMap {
            ($0.key, $0.value.filter { $0.name.contains(text)})
        })

        self.filteredRegions = zip(unfilteredRegions, filteredPokemonNotCompactedWithoutEmptyKeys).compactMap { region, pokemonRegion in
            guard !pokemonRegion.value.isEmpty else { return nil }
            return region
        }

        self.filteredPokemon = filteredPokemonNotCompactedWithoutEmptyKeys.compactMapValues { $0.filter { $0.name.contains(text) } }.filter { !$0.value.isEmpty }

        print(filteredPokemon)
        completion()
    }
}
