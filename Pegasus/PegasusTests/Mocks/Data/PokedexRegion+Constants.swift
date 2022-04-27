//
//  PokedexRegion+Constants.swift
//  PegasusTests
//
//  Created by Tiago on 06/04/2022.
//

import Foundation
@testable import Pegasus

extension PokedexRegion {
    static let kanto: PokedexRegion = .init(generation: 1, name: "Kanto", pokemon: [.bulbasaur])
    static let johto: PokedexRegion = .init(generation: 2, name: "Johto", pokemon: [.chikorita])
    static let hoenn: PokedexRegion = .init(generation: 3, name: "Hoenn", pokemon: [.treecko])
    static let sinnoh: PokedexRegion = .init(generation: 4, name: "Sinnoh", pokemon: [.turtwig])
    static let unova: PokedexRegion = .init(generation: 5, name: "Unova", pokemon: [.snivy])
    static let kalos: PokedexRegion = .init(generation: 6, name: "Kalos", pokemon: [.chespin])
    static let alola: PokedexRegion = .init(generation: 7, name: "Alola", pokemon: [.rowlet])
    static let galar: PokedexRegion = .init(generation: 8, name: "Galar", pokemon: [.grookey])
    static let spain: PokedexRegion = .init(generation: 9, name: "Spain", pokemon: [.sprigatito])
}
