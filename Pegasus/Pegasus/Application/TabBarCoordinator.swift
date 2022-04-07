//
//  TabBarCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupController()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    func setupController() {
        tabBar.tintColor = Color.TabBar.tint
        tabBar.barTintColor = Color.TabBar.barTint
        tabBar.unselectedItemTintColor = Color.TabBar.unselectedItemTint
        tabBar.isTranslucent = false
        tabBar.backgroundColor = Color.TabBar.background
    }
}

final class TabBarCoordinator: Coordinator {

    // MARK: - Properties

    private let dependencies: DependencyContainable
    private let tabBarController: UITabBarController
    private let window: UIWindow

    // MARK: - Initalization

    init(dependencies: DependencyContainable, tabBarController: UITabBarController, window: UIWindow) {
        self.dependencies = dependencies
        self.tabBarController = tabBarController
        self.window = window
    }

    // MARK: -

    func start() {
        let listCoordinator = PokemonListCoordinator(dependencies: dependencies)
        let settingsCoordinator = SettingsCoordinator(dependencies: dependencies)
        let viewControllers = ([listCoordinator, settingsCoordinator] as [ViewControllerRepresentable]).map { $0.viewController }

        let items: [UITabBarItem] = [.init(title: Localizable.pegasus, image: .TabBar.magazine, selectedImage: .TabBar.magazine),
                                     .init(title: Localizable.settings, image: .TabBar.gear, selectedImage: .TabBar.gear)]

        items.enumerated().forEach { viewControllers[$0.offset].tabBarItem = $0.element }

        tabBarController.setViewControllers(viewControllers, animated: false)

        window.rootViewController = tabBarController

        ([listCoordinator, settingsCoordinator] as [Coordinator]).forEach { initiate(coordinator: $0) }
    }
}
