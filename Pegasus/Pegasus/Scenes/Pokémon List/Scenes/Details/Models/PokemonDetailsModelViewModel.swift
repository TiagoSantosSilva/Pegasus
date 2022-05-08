//
//  PokemonDetailsModelViewModel.swift
//  Pegasus
//
//  Created by Tiago on 08/05/2022.
//

import UIKit

struct PokemonDetailsModelViewModel {

    // MARK: - Properties

    let height: String
    let weight: String
    let types: [PokemonTypeViewModel]

    // MARK: - Initialization

    init(raw: PokemonDetailsModel) {
        self.height = HeightFactory.make(for: String(reducingOneOrderOfMagnitudeFrom: raw.height))
        self.weight = WeightFactory.make(for: String(reducingOneOrderOfMagnitudeFrom: raw.weight))
        self.types = raw.types.map { PokemonTypeViewModel(name: $0.type.name) }
    }
}

struct PokemonTypeViewModel {

    // MARK: - Properties

    let name: String
    let image: UIImage?

    // MARK: - Initialization
    
    init(name: String) {
        self.name = name.uppercased()
        self.image = UIImage(named: "type-\(name)")
    }
}
