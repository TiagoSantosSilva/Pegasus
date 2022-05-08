//
//  PokemonDetailsModel.swift
//  Pegasus
//
//  Created by Tiago on 08/05/2022.
//

import Foundation

struct PokemonDetailsModel: Decodable {

    // MARK: - Properties

    let height: Int
    let weight: Int
    let types: [PokemonDetailsTypeModel]

    // MARK: - Coding Keys
}

struct PokemonDetailsTypeModel: Decodable {

    // MARK: - Properties

    let slot: Int
    let type: PokemonDetailsType

    // MARK: - Internal Classes

    struct PokemonDetailsType: Decodable {
        let name: String
    }
}
