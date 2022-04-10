//
//  PokemonListCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation
import UIKit

enum PokemonListCellViewModelImageVariant: String {
    case normal
    case shiny
}

final class PokemonListCellViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let number: String
    let name: String
    lazy var image: UIImage = Self.image(for: number, variant: .normal)
    lazy var shinyImage: UIImage = Self.image(for: number, variant: .shiny)

    // MARK: - Initialization
    
    init(number: String, name: String) {
        self.number = number
        self.name = name
    }

    // MARK: - Static Functions

    static func image(for number: String, variant: PokemonListCellViewModelImageVariant) -> UIImage {
        let numberAsInt = Int(number) ?? Constants.defaultNumber
        let name = String(describing: numberAsInt).appending("-").appending(variant.rawValue)
        return UIImage(named: name) ?? UIImage(named: String(describing: Constants.defaultNumber))!
    }

    static func == (lhs: PokemonListCellViewModel, rhs: PokemonListCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

// MARK: - Constants

private enum Constants {
    static let defaultNumber: Int = .zero
}
