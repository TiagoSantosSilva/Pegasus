//
//  PokemonListCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

enum PokemonListCellViewModelImageVariant: String {
    case normal
    case shiny

    init(from refinementVariant: RefinementVariant) {
        switch refinementVariant {
        case .normal:
            self = .normal
        case .shiny:
            self = .shiny
        }
    }
}

typealias PokemonListCellViewModelNumber = String

final class PokemonListCellViewModel {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let number: PokemonListCellViewModelNumber
    let name: String
    private(set) var image: UIImage

    // MARK: - Initialization
    
    init(number: String, name: String) {
        self.number = number
        self.name = name
        self.image = Self.image(for: .normal, number: number)
    }

    // MARK: - Configuration

    func configure(for variant: PokemonListCellViewModelImageVariant) {
        self.image = Self.image(for: variant, number: number)
    }

    // MARK: - Static Functions

    private static func image(for variant: PokemonListCellViewModelImageVariant, number: String) -> UIImage {
        let name = Self.imageName(for: variant, number: number)
        guard let image = UIImage(named: name) else {
            guard let defaultImage = UIImage(named: String(describing: Constants.defaultNumber)) else {
                fatalError(Constants.defaultImageNotFoundError)
            }
            return defaultImage
        }
        return image
    }

    private static func imageName(for variant: PokemonListCellViewModelImageVariant, number: String) -> String {
        let numberAsInt = Int(number) ?? Constants.defaultNumber
        return String(describing: numberAsInt)
            .appending(String.dash)
            .appending(variant.rawValue)
    }
}

// MARK: - Hashable

extension PokemonListCellViewModel: Hashable {
    static func == (lhs: PokemonListCellViewModel, rhs: PokemonListCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

extension PokemonListCellViewModel: Equalable {
    func isEqual(to other: PokemonListCellViewModel) -> Bool {
        number == other.number && name == other.name
    }
}

// MARK: - PokemonListCellViewModelNumber

extension PokemonListCellViewModelNumber {
    static func < (lhs: PokemonListCellViewModelNumber, rhs: PokemonListCellViewModelNumber) -> Bool {
        guard let firstNumber = Int(lhs), let secondNumber = Int(rhs) else { return false }
        return firstNumber < secondNumber
    }
}

// MARK: - Constants

private enum Constants {
    static let defaultNumber: Int = .zero
    static let defaultImageNotFoundError: String = "Default pokémon image not found."
}
