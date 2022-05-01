//
//  SettingsThemeChoiceCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

final class SettingsThemeChoiceCoordinator: Coordinator {

    // MARK: - Dependencies

    private let navigator: Navigatable

    // MARK: - Initialization

    init(dependencies: DependencyContainable, navigator: Navigatable) {
        self.navigator = navigator
        super.init()
    }

    // MARK: - Coordinator

    func start() {
        let viewModel = SettingsThemeChoiceViewModel()
        let collectionViewController = SettingsThemeChoiceCollectionViewController()
        let viewController = SettingsThemeChoiceViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        viewController.delegate = self
        navigator.transition(to: viewController, as: .push)
    }
}

// MARK: - SettingsViewControllerDelegate

extension SettingsThemeChoiceCoordinator: SettingsThemeChoiceViewControllerDelegate {
    func viewController(_ viewController: SettingsThemeChoiceViewController, didSelect indexPath: IndexPath) {
        print(indexPath)
    }
}
