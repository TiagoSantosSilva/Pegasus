//
//  TabBarCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

final class TabBarCoordinator: Coordinator {

    // MARK: - Properties

    private let dependencies: DependencyContainable
    private let tabBarController: TabBarController
    private let window: UIWindow

    // MARK: - Initalization

    init(dependencies: DependencyContainable, tabBarController: TabBarController, window: UIWindow) {
        self.dependencies = dependencies
        self.tabBarController = tabBarController
        self.window = window
        super.init()
        
        setupThemeChangeHandling()
    }

    // MARK: - Functions

    func start() {
        let listCoordinator = PokemonListCoordinator(dependencies: dependencies)
        let galleryCoordinator = GalleryCoordinator(dependencies: dependencies)
        let settingsCoordinator = createSettingsCoordinator()

        let viewControllers = ([listCoordinator, galleryCoordinator, settingsCoordinator] as [ViewControllerRepresentable]).map { $0.viewController }
        let items: [UITabBarItem] = [.init(title: Localizable.pegasus, image: .TabBar.display, selectedImage: .TabBar.display),
                                     .init(title: Localizable.gallery, image: .TabBar.photo, selectedImage: .TabBar.photo),
                                     .init(title: Localizable.settings, image: .TabBar.gear, selectedImage: .TabBar.gear)]

        items.enumerated().forEach { viewControllers[$0.offset].tabBarItem = $0.element }

        tabBarController.setViewControllers(viewControllers, animated: false)
        window.rootViewController = tabBarController
        ([listCoordinator, galleryCoordinator, settingsCoordinator] as [Coordinator]).forEach { initiate(coordinator: $0) }
    }

    // MARK: - Private Functions

    private func setupThemeChangeHandling() {
        dependencies.themeEnvironment.themeSubject.sink { [weak self] in
            self?.tabBarController.apply(tint: $0.color)
        }.store(in: &CancellableStorage.shared.cancellables)
    }

    private func createSettingsCoordinator() -> SettingsCoordinator {
        let emailSceneController = SettingsEmailSceneController()
        let reducer = SettingsSceneReducer()
        let universalLinkController = SettingsUniversalLinkController()
        return SettingsCoordinator(dependencies: dependencies,
                                   emailSceneController: emailSceneController,
                                   reducer: reducer,
                                   universalLinkController: universalLinkController)
    }
}
