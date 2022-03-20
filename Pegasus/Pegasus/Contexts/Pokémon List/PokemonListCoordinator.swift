//
//  PokemonListCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

final class PokemonListCoordinator {
    
    // MARK: - Properties
    
    private let window: UIWindow?
    
    // MARK: - Initialization
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let collectionViewController = PokemonListCollectionViewController()
        let viewController = PokemonListViewController(collectionViewController: collectionViewController)
        let navigationController = NavigationController(rootViewController: viewController)
        
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.backgroundColor = .red
//        navigationController.navigationBar.standardAppearance = navBarAppearance
//        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        window?.rootViewController = navigationController
    }
}
