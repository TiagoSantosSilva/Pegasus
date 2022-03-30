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

    private let dependencies: DependencyContainable
    private let navigator: Navigator

    // MARK: - Initialization

    init(dependencies: DependencyContainable) {
        let collectionViewController = PokemonListCollectionViewController()
        let loader = PokemonListLoader(networkEngine: dependencies.networkEngine)
        let viewModel = PokemonListViewModel(loader: loader)
        let viewController = PokemonListViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)
        self.dependencies = dependencies
        self.navigator = Navigator(navigationController: navigationController)
        super.init()
        viewController.delegate = self
    }

    // MARK: - Coordinator

    func start() { }
}

// MARK: - Pokemon List View Controller Delegate

extension PokemonListCoordinator: PokemonListViewControllerDelegate {
    func viewController(_ viewController: PokemonListViewController, didTap refinementButton: UIBarButtonItem) {
        initiate(coordinator: RefinementCoordinator(dependencies: dependencies, navigator: navigator))
    }
}
