//
//  AppCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

final class AppCoordinator: Coordinator {

    // MARK: - Properties

    private let coordinator: TabBarCoordinator
    
    // MARK: - Initialization

    init(dependencies: DependencyContainable, window: UIWindow) {
        self.coordinator = TabBarCoordinator(dependencies: dependencies,
                                             tabBarController: TabBarController(),
                                             window: window)
    }

    // MARK: - Coordinator

    func start() {
        coordinator.start()
    }
}
