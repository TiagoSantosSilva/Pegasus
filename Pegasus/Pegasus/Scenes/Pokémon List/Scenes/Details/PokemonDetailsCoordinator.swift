//
//  PokemonDetailsCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

final class PokemonDetailsCoordinator: Coordinator {

    // MARK: - Properties

    private let dependencies: DependencyContainable
    private let navigator: Navigatable
    private let pokemon: PokemonListCellViewModel

    // MARK: - Initialization

    init(dependencies: DependencyContainable, navigator: Navigatable, pokemon: PokemonListCellViewModel) {
        self.dependencies = dependencies
        self.navigator = navigator
        self.pokemon = pokemon
        super.init()
    }

    // MARK: - Functions

    func start() {
        let scrollView = PokemonDetailsScrollView()
        let viewModel = PokemonDetailsViewModel(pokemon: pokemon)
        let viewController = PokemonDetailsViewController(scrollView: scrollView, viewModel: viewModel)
        navigator.transition(to: viewController, as: .push)
        viewController.delegate = self
    }
}

// MARK: - Pokemon Details View Controller Delegate

extension PokemonDetailsCoordinator: PokemonDetailsViewControllerDelegate {
    func viewControllerDidPop(_ viewController: PokemonDetailsViewController) {
        end()
    }
}
