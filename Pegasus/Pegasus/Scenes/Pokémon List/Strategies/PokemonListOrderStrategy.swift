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
            return numberAscending(groups: groups)
        case .numberDescending:
            return numberDescending(groups: groups)
        case .nameAscending:
            return nameAscending(groups: groups)
        case .nameDescending:
            return nameDescending(groups: groups)
        }
    }

    // MARK: - Private Functions

    private func numberAscending(groups: [PokemonListGroupViewModel]) -> [PokemonListGroupViewModel] {
        groups.sorted {
            guard let firstRegion = $0.region, let secondRegion = $1.region else { return false }
            return firstRegion.number < secondRegion.number
        }.map {
            PokemonListGroupViewModel(region: $0.region, pokemon: $0.pokemon.sorted {
                guard let firstNumber = Int($0.number), let secondNumber = Int($1.number) else { return false }
                return firstNumber < secondNumber
            })
        }
    }

    private func numberDescending(groups: [PokemonListGroupViewModel]) -> [PokemonListGroupViewModel] {
        groups.sorted {
            guard let firstRegion = $0.region, let secondRegion = $1.region else { return false }
            return firstRegion.number > secondRegion.number
        }.map {
            PokemonListGroupViewModel(region: $0.region, pokemon: $0.pokemon.sorted {
                guard let firstNumber = Int($0.number), let secondNumber = Int($1.number) else { return false }
                return firstNumber > secondNumber
            })
        }
    }

    private func nameAscending(groups: [PokemonListGroupViewModel]) -> [PokemonListGroupViewModel] {
        let pokemon = groups.reduce([PokemonListCellViewModel]()) { partialResult, group in
            partialResult + group.pokemon
        }.sorted { $0.name < $1.name }

        return [.init(region: nil, pokemon: pokemon)]
    }

    private func nameDescending(groups: [PokemonListGroupViewModel]) -> [PokemonListGroupViewModel] {
        let pokemon = groups.reduce([PokemonListCellViewModel]()) { partialResult, group in
            partialResult + group.pokemon
        }.sorted { $0.name > $1.name }

        return [.init(region: nil, pokemon: pokemon)]
    }
}
