//
//  PokemonListOrderStrategy.swift
//  Pegasus
//
//  Created by Tiago on 12/04/2022.
//

import Foundation

protocol PokemonListOrderStrategyable {
    func order(groups: [PokemonListGroupViewModel], by order: RefinementOrder) -> [PokemonListGroupViewModel]
}

struct PokemonListOrderStrategy: PokemonListOrderStrategyable {

    // MARK: - Functions

    func order(groups: [PokemonListGroupViewModel], by order: RefinementOrder) -> [PokemonListGroupViewModel] {
        switch order {
        case .numberAscending:
            return byNumber(groups: groups, orderingRegions: <, orderingPokemon: <)
        case .numberDescending:
            return byNumber(groups: groups, orderingRegions: >, orderingPokemon: >)
        case .nameAscending:
            return byName(groups: groups, using: <)
        case .nameDescending:
            return byName(groups: groups, using: >)
        }
    }

    // MARK: - Private Functions

    private func byNumber(groups: [PokemonListGroupViewModel],
                          orderingRegions regionComparator: @escaping (Int, Int) -> Bool,
                          orderingPokemon pokemonComparator: @escaping (String, String) -> Bool) -> [PokemonListGroupViewModel] {
        groups.sorted(by: \.region.number, using: regionComparator).map {
            PokemonListGroupViewModel(region: $0.region, pokemon: $0.pokemon.sorted(by: \.number, using: pokemonComparator))
        }
    }

    private func byName(groups: [PokemonListGroupViewModel],
                        using comparator: @escaping (String, String) -> Bool) -> [PokemonListGroupViewModel] {
        let pokemon = groups.reduce([PokemonListCellViewModel]()) { partialResult, group in
            partialResult + group.pokemon
        }.sorted(by: \.name, using: comparator)
        
        return [.init(region: .none, pokemon: pokemon)]
    }
}
