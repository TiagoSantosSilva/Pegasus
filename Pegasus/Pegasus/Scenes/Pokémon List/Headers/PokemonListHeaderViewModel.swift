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
    let number: Int

    // MARK: - Initialization

    init(name: String, number: Int, pokemonCount: Int) {
        let string = NSMutableAttributedString(string: name, attributes: PokemonListHaderViewModelAttributer.nameAttributes)
        let countString = NSAttributedString(string: PokemonListHeaderStringFormatter.format(count: pokemonCount),
                                             attributes: PokemonListHaderViewModelAttributer.countAttributes)
        string.append(countString)

        self.name = name
        self.number = number
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

// MARK: - Equalable

extension PokemonListHeaderViewModel: Equalable {
    func isEqual(to other: PokemonListHeaderViewModel) -> Bool {
        title.string == other.title.string && name == other.name && number == other.number
    }
}

extension PokemonListHeaderViewModel {
    static let none: PokemonListHeaderViewModel = .init(name: .empty, number: 0, pokemonCount: 0)
}
