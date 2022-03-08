//
//  AppDelegate.swift
//  Pegasus
//
//  Created by Tiago on 07/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    lazy var window: UIWindow? = .init(frame: UIScreen.main.bounds)
    private lazy var coordinator: PokemonListCoordinator = .init(window: window)

    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.makeKeyAndVisible()
        coordinator.start()
        return true
    }
}

