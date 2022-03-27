//
//  PokemonListCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

final class PokemonListCoordinator: Coordinator, ViewControllerRepresentable {

    // MARK: - Internal Properties

    var viewController: UIViewController { navigator.navigationController }

    // MARK: - Private Properties

    private let navigator: Navigator

    // MARK: - Initialization

    init(dependencies: DependencyContainable) {
        let collectionViewController = PokemonListCollectionViewController()
        let loader = PokemonListLoader(networkEngine: dependencies.networkEngine)
        let viewModel = PokemonListViewModel(loader: loader)
        let viewController = PokemonListViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)

        self.navigator = Navigator(navigationController: navigationController)
    }

    // MARK: - Coordinator

    func start() {

    }
}
