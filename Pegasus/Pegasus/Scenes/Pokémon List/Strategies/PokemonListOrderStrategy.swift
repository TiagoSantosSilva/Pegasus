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
            return byNumber(groups: groups, using: <)
        case .numberDescending:
            return byNumber(groups: groups, using: >)
        case .nameAscending:
            return byName(groups: groups, using: <)
        case .nameDescending:
            return byName(groups: groups, using: >)
        }
    }

    // MARK: - Private Functions

    private func byNumber(groups: [PokemonListGroupViewModel],
                          using comparator: @escaping (Int, Int) -> Bool) -> [PokemonListGroupViewModel] {
        groups.sorted {
            guard let firstRegion = $0.region, let secondRegion = $1.region else { return false }
            return comparator(firstRegion.number, secondRegion.number)
        }.map {
            PokemonListGroupViewModel(region: $0.region, pokemon: $0.pokemon.sorted {
                guard let firstNumber = Int($0.number), let secondNumber = Int($1.number) else { return false }
                return comparator(firstNumber, secondNumber)
            })
        }
    }

    private func byName(groups: [PokemonListGroupViewModel],
                        using comparator: @escaping (String, String) -> Bool) -> [PokemonListGroupViewModel] {
        let pokemon = groups.reduce([PokemonListCellViewModel]()) { partialResult, group in
            partialResult + group.pokemon
        }.sorted(by: \.name, using: comparator)

        return [.init(region: nil, pokemon: pokemon)]
    }
}
