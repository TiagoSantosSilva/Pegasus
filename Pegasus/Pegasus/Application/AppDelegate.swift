//
//  AppDelegate.swift
//  Pegasus
//
//  Created by Tiago on 07/03/2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    private let dependencies: DependencyContainable

    private lazy var coordinator: AppCoordinator = {
        guard let window = window else { fatalError() }
        return AppCoordinator(dependencies: dependencies, window: window)
    }()

    // MARK: - Initialization

    override init() {
        self.dependencies = DependencyContainer()
        super.init()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.makeKeyAndVisible()
        coordinator.start()
        return true
    }
}
