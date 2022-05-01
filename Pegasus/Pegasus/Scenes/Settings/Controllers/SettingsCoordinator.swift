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

    private let dependencies: DependencyContainable
    private let navigator: Navigatable
    private let emailSceneController: SettingsEmailSceneControllable
    private let reducer: SettingsSceneReducer
    private let universalLinkController: SettingsUniversalLinkControllable

    // MARK: - Initialization

    init(dependencies: DependencyContainable,
         emailSceneController: SettingsEmailSceneControllable,
         reducer: SettingsSceneReducer,
         universalLinkController: SettingsUniversalLinkControllable) {
        let viewModel = SettingsViewModel()
        let collectionViewController = SettingsCollectionViewController()
        let viewController = SettingsViewController(dependencies: dependencies, collectionViewController: collectionViewController, viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)
        self.navigator = Navigator(dependencies: dependencies, navigationController: navigationController)
        self.dependencies = dependencies
        self.reducer = reducer
        self.emailSceneController = emailSceneController
        self.universalLinkController = universalLinkController
        super.init()
        viewController.delegate = self
    }

    // MARK: - Coordinator

    func start() { }

    // MARK: - Private Functions

    private func handle(scene: SettingsScene) {
        switch scene {
        case .applicationIcon:
            initiate(coordinator: SettingsApplicationIconChoiceCoordinator(dependencies: dependencies, navigator: navigator))
        case .theme:
            initiate(coordinator: SettingsThemeChoiceCoordinator(dependencies: dependencies, navigator: navigator))
        }
    }
}

// MARK: - SettingsViewControllerDelegate

extension SettingsCoordinator: SettingsViewControllerDelegate {
    func viewController(_ viewController: SettingsViewController, didSelect indexPath: IndexPath) {
        reducer.handle(itemAt: indexPath) { action in
            switch action {
            case let .email(email, subject):
                emailSceneController.openEmail(sendingTo: email, subject: subject, in: self.viewController)
            case let .universalLink(link):
                universalLinkController.open(link)
            case let .scene(scene):
                handle(scene: scene)
            }
        }
    }
}
