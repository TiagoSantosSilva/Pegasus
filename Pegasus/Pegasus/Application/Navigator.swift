//
//  Navigator.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

enum NavigatorTransition {
    case root
    case push
    case modal
}

protocol Navigatable {
    var navigationController: NavigationController { get }

    func dismiss()
    func pop(animated: Bool)
    func transition(to viewController: UIViewController, as transitionType: NavigatorTransition, animated: Bool)
}

extension Navigatable {
    func pop(animated: Bool) {
        pop(animated: true)
    }
    
    func transition(to viewController: UIViewController, as transitionType: NavigatorTransition) {
        transition(to: viewController, as: transitionType, animated: true)
    }
}

final class Navigator: Navigatable {

    // MARK: - Navigation Controller

    let navigationController: NavigationController

    // MARK: - Initialization

    init(dependencies: DependencyContainable, navigationController: NavigationController) {
        self.navigationController = navigationController
        
        setupThemeChangeHandling(dependencies: dependencies)
    }

    // MARK: - Public Functions

    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }

    func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }

    func transition(to viewController: UIViewController, as transitionType: NavigatorTransition, animated: Bool) {
        switch transitionType {
        case .root:
            navigationController.setViewControllers([viewController], animated: animated)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .modal:
            navigationController.present(viewController, animated: animated, completion: nil)
        }
    }

    // MARK: - Private Functions

    func setupThemeChangeHandling(dependencies: DependencyContainable) {
        dependencies.themeEnvironment.themeSubject.sink { [weak self] in
            self?.navigationController.apply(tint: $0.color)
        }.store(in: &CancellableStorage.shared.cancellables)
    }
}
