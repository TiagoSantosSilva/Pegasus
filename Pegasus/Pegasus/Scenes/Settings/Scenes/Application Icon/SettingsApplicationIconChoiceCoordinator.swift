//
//  SettingsApplicationIconChoiceCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

final class SettingsApplicationIconChoiceCoordinator: Coordinator {

    // MARK: - Dependencies

    private let navigator: Navigatable

    // MARK: - Initialization

    init(dependencies: DependencyContainable, navigator: Navigatable) {
        self.navigator = navigator
        super.init()
    }

    // MARK: - Coordinator

    func start() {
        let viewModel = SettingsApplicationIconChoiceViewModel()
        let collectionViewController = SettingsApplicationIconChoiceCollectionViewController()
        let viewController = SettingsApplicationIconChoiceViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        viewController.delegate = self
        navigator.transition(to: viewController, as: .push)
    }
}

// MARK: - SettingsViewControllerDelegate

extension SettingsApplicationIconChoiceCoordinator: SettingsApplicationIconChoiceViewControllerDelegate {
    func viewController(_ viewController: SettingsApplicationIconChoiceViewController, didSelect indexPath: IndexPath) {
        print(indexPath)
    }
}
