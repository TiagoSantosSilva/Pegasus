//
//  SettingsCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

final class SettingsCoordinator: Coordinator, ViewControllerRepresentable {

    // MARK: - Internal Properties

    var viewController: UIViewController { navigator.navigationController }

    // MARK: - Private Properties

    private let navigator: Navigator

    // MARK: - Initialization

    init(dependencies: DependencyContainable) {
        let viewModel = SettingsViewModel()
        let collectionViewController = SettingsCollectionViewController()
        let viewController = SettingsViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)
        self.navigator = Navigator(navigationController: navigationController)
    }

    // MARK: - Coordinator

    func start() {

    }
}
