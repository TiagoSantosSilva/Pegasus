//
//  PokemonListCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

struct PokemonListCellViewModel: Hashable {

    // MARK: - Properties

    let number: String
    let name: String

    // MARK: - Initialization
    
    init(number: String, name: String) {
        self.number = number
        self.name = name
    }
}
