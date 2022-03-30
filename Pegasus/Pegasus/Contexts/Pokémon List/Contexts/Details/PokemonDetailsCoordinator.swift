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

    // MARK: - Initialization

    init(dependencies: DependencyContainable, navigator: Navigatable) {
        self.dependencies = dependencies
        self.navigator = navigator
    }

    // MARK: - Functions

    func start() {
        let viewModel = PokemonDetailsViewModel()
        let viewController = PokemonDetailsViewController(viewModel: viewModel)
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
