//
//  PokemonListSearchController.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import UIKit

final class PokemonListSearchController: SearchController {

    // MARK: - Initialization

    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        setup()
    }

    // MARK: - Functions

    private func setup() {
        searchBar.placeholder = Localizable.searchPlaceholder
    }
}
