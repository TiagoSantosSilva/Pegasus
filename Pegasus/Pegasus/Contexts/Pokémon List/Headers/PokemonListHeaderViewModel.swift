//
//  PokemonListHeaderViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

final class PokemonListHeaderViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()

    let title: NSAttributedString
    let name: String

    // MARK: - Initialization

    init(name: String, pokemonCount: Int) {
        let string = NSMutableAttributedString(string: name, attributes: PokemonListHaderViewModelAttributer.nameAttributes)
        let countString = NSAttributedString(string: PokemonListHeaderStringFormatter.format(count: pokemonCount),
                                             attributes: PokemonListHaderViewModelAttributer.countAttributes)
        string.append(countString)

        self.name = name
        self.title = string
    }

    // MARK: - Functions

    static func == (lhs: PokemonListHeaderViewModel, rhs: PokemonListHeaderViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
