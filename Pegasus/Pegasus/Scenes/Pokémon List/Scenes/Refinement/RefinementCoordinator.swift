//
//  RefinementCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

protocol RefinementCoordinatorDelegate: AnyObject {
    func coordinator(_ coordinator: RefinementCoordinator, didDismissWith choices: RefinementChoices)
}

final class RefinementCoordinator: Coordinator {

    // MARK: - Properties

    weak var delegate: RefinementCoordinatorDelegate?

    private let dependencies: DependencyContainable
    private let navigator: Navigatable

    // MARK: - Initialization

    init(dependencies: DependencyContainable, navigator: Navigatable) {
        self.dependencies = dependencies
        self.navigator = navigator
    }

    // MARK: - Coordinator

    func start() {
        let viewModel = RefinementViewModel(dependencies: dependencies)
        let collectionViewController = RefinementCollectionViewController()
        let viewController = RefinementViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)
        navigator.transition(to: navigationController, as: .modal)
        viewController.delegate = self
    }
}

// MARK: - RefinementViewControllerDelegate

extension RefinementCoordinator: RefinementViewControllerDelegate {
    func viewController(_ viewController: RefinementViewController, didTap doneButton: UIBarButtonItem, with choices: RefinementChoices) {
        delegate?.coordinator(self, didDismissWith: choices)
        navigator.dismiss()
        end()
    }
}
