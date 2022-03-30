//
//  PokemonListHeaderViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

protocol PokemonListHeaderViewModelable: AnyObject {

}

final class PokemonListHeaderViewModel: PokemonListHeaderViewModelable, Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()

    let name: NSAttributedString

    // MARK: - Initialization

    init(region: PokedexRegion) {
        let string = NSMutableAttributedString(string: region.name, attributes: PokemonListHaderViewModelAttributer.nameAttributes)
        let countString = NSAttributedString(string: PokemonListHeaderStringFormatter.format(count: region.pokemon.count),
                                             attributes: PokemonListHaderViewModelAttributer.countAttributes)
        string.append(countString)

        self.name = string
    }

    // MARK: - Functions

    static func == (lhs: PokemonListHeaderViewModel, rhs: PokemonListHeaderViewModel) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
