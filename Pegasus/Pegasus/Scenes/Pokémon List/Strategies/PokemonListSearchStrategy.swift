//
//  PokemonListSearchStrategy.swift
//  Pegasus
//
//  Created by Tiago on 07/04/2022.
//

import Foundation

protocol PokemonListSearchStrategyable: AnyObject {
    func search(for text: String, in groups: [PokemonListGroupViewModel]) -> [PokemonListGroupViewModel]
}

final class PokemonListSearchStrategy: PokemonListSearchStrategyable {

    // MARK: - Closures

    private lazy var numberSearchClosure: ([PokemonListCellViewModel], String) -> [PokemonListCellViewModel] = { pokemon, text in
        pokemon.filter { $0.number.contains(text) }
    }

    private lazy var nameSearchClosure: ([PokemonListCellViewModel], String) -> [PokemonListCellViewModel] = { pokemon, text in
        pokemon.filter { $0.name.contains(text) }
    }

    // MARK: - Functions

    func search(for text: String, in groups: [PokemonListGroupViewModel]) -> [PokemonListGroupViewModel] {
        guard !text.isEmpty else { return groups }

        let isSearchingForNumber = Int(text) != nil
        let searchClosure = isSearchingForNumber ? numberSearchClosure : nameSearchClosure

        let groups: [PokemonListGroupViewModel] = groups.compactMap {
            let pokemon = searchClosure($0.pokemon, text)
            guard !pokemon.isEmpty else { return nil }
            let region = $0.region
            let headerViewModel = PokemonListHeaderViewModel(name: region.name, number: region.number, pokemonCount: pokemon.count)
            return PokemonListGroupViewModel(region: headerViewModel, pokemon: pokemon)
        }

        return groups
    }
}
