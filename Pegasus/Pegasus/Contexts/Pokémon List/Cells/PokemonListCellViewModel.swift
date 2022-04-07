//
//  PokemonListCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation
import UIKit

struct PokemonListCellViewModel: Hashable {

    // MARK: - Properties

    let number: String
    let name: String
    let image: UIImage

    // MARK: - Initialization
    
    init(number: String, name: String) {
        self.number = number
        self.name = name
        let numberAsInt = Int(number) ?? Constants.defaultNumber
        self.image = UIImage(named: String(describing: numberAsInt).appending("-shiny")) ?? UIImage(named: String(describing: Constants.defaultNumber))!
    }
}

// MARK: - Constants

private enum Constants {
    static let defaultNumber: Int = .zero
}
