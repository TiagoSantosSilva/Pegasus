//
//  PokedexRegion+Constants.swift
//  PegasusTests
//
//  Created by Tiago on 06/04/2022.
//

import Foundation
@testable import Pegasus

extension PokedexRegion {
    static let kanto: PokedexRegion = .init(name: "Kanto", pokemon: [.bulbasaur])
    static let johto: PokedexRegion = .init(name: "Johto", pokemon: [.chikorita])
    static let hoenn: PokedexRegion = .init(name: "Hoenn", pokemon: [.treecko])
    static let sinnoh: PokedexRegion = .init(name: "Sinnoh", pokemon: [.turtwig])
    static let unova: PokedexRegion = .init(name: "Unova", pokemon: [.snivy])
    static let kalos: PokedexRegion = .init(name: "Kalos", pokemon: [.chespin])
    static let alola: PokedexRegion = .init(name: "Alola", pokemon: [.rowlet])
    static let galar: PokedexRegion = .init(name: "Galar", pokemon: [.grookey])
    static let spain: PokedexRegion = .init(name: "Spain", pokemon: [.sprigatito])
}
