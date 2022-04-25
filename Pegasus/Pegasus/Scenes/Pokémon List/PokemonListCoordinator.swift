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
    private weak var listViewController: PokemonListViewControllable?

    // MARK: - Initialization

    init(dependencies: DependencyContainable) {
        let collectionViewController = PokemonListCollectionViewController()
        let searchController = PokemonListSearchController(searchResultsController: nil)
        let loader = PokemonListLoader()
        let orderStrategy = PokemonListOrderStrategy()
        let regionStrategy = PokemonListRegionStrategy()
        let searchStrategy = PokemonListSearchStrategy()
        let viewModel = PokemonListViewModel(loader: loader,
                                             orderStrategy: orderStrategy,
                                             regionStrategy: regionStrategy,
                                             searchStrategy: searchStrategy)
        let viewController = PokemonListViewController(collectionViewController: collectionViewController,
                                                       searchController: searchController,
                                                       viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)
        self.dependencies = dependencies
        self.navigator = Navigator(navigationController: navigationController)
        self.listViewController = viewController
        super.init()
        viewController.delegate = self
    }

    // MARK: - Coordinator

    func start() { }
}

// MARK: - PokemonListViewControllerDelegate

extension PokemonListCoordinator: PokemonListViewControllerDelegate {
    func viewController(_ viewController: PokemonListViewController,
                        didTap refinementButton: UIBarButtonItem,
                        with choices: RefinementChoices,
                        defaultChoices: RefinementChoices) {
        let coordinator = RefinementCoordinator(dependencies: dependencies, navigator: navigator, choices: choices, defaultChoices: defaultChoices)
        coordinator.delegate = self
        initiate(coordinator: coordinator)
    }

    func viewController(_ viewController: PokemonListViewController, didSelect pokemon: PokemonListCellViewModel) {
        initiate(coordinator: PokemonDetailsCoordinator(dependencies: dependencies, navigator: navigator, pokemon: pokemon))
    }
}

// MARK: - RefinementCoordinatorDelegate

extension PokemonListCoordinator: RefinementCoordinatorDelegate {
    func coordinator(_ coordinator: RefinementCoordinator, didDismissWith choices: RefinementChoices) {
        listViewController?.applyRefinement(with: choices)
    }
}
