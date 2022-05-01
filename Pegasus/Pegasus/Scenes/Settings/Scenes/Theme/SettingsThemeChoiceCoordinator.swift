//
//  SettingsThemeChoiceCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

final class SettingsThemeChoiceCoordinator: Coordinator {

    // MARK: - Dependencies

    private let dependencies: DependencyContainable
    private let navigator: Navigatable

    // MARK: - Initialization

    init(dependencies: DependencyContainable, navigator: Navigatable) {
        self.dependencies = dependencies
        self.navigator = navigator
        super.init()
    }

    // MARK: - Coordinator

    func start() {
        let themeApplier = SettingsThemeChoiceApplier(environment: dependencies.themeEnvironment)
        let viewModel = SettingsThemeChoiceViewModel(applier: themeApplier)
        let collectionViewController = SettingsThemeChoiceCollectionViewController()
        let viewController = SettingsThemeChoiceViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        navigator.transition(to: viewController, as: .push)
    }
}
