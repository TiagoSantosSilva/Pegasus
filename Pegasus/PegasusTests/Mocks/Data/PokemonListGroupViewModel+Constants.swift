//
//  PokemonListGroupViewModel+Constants.swift
//  PegasusTests
//
//  Created by Tiago on 28/04/2022.
//

import Foundation
@testable import Pegasus

extension PokemonListGroupViewModel {
    static let kanto: PokemonListGroupViewModel = .init(region: .kanto, pokemon: [.bulbasaur, .charmander, .squirtle])
    static let johto: PokemonListGroupViewModel = .init(region: .johto, pokemon: [.chikorita, .cyndaquill, .totodile])
}

extension PokemonListGroupViewModel {
    func appending(_ pokemon: PokemonListCellViewModel...) -> PokemonListGroupViewModel {
        PokemonListGroupViewModel(region: region, pokemon: self.pokemon + pokemon)
    }
}
