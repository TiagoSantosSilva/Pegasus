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

    init(navigationController: NavigationController)

    func dismiss()
    func transition(to viewController: UIViewController, as transitionType: NavigatorTransition, animated: Bool)
}

extension Navigatable {
    func transition(to viewController: UIViewController, as transitionType: NavigatorTransition) {
        transition(to: viewController, as: transitionType, animated: true)
    }
}

final class Navigator: Navigatable {

    // MARK: - Navigation Controller

    let navigationController: NavigationController

    // MARK: - Initialization

    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public Functions

    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
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
}
