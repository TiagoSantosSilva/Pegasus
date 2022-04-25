//
//  PokemonListRegionStrategy.swift
//  Pegasus
//
//  Created by Tiago on 17/04/2022.
//

import Foundation

protocol PokemonListRegionStrategiable {
    func regions(in groups: [PokemonListGroupViewModel], using regions: [RefinementRegion]) -> [PokemonListGroupViewModel]
}

struct PokemonListRegionStrategy: PokemonListRegionStrategiable {

    // MARK: - Functions

    func regions(in groups: [PokemonListGroupViewModel], using regions: [RefinementRegion]) -> [PokemonListGroupViewModel] {
        let mappedRegions = regions.map { $0.rawValue }
        return groups.filter {
            let regionName = $0.region.name.lowercased()
            return mappedRegions.contains(regionName)
        }
    }
}
