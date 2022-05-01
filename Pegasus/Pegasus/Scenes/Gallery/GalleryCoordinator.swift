//
//  GalleryCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 11/04/2022.
//

import UIKit

final class GalleryCoordinator: Coordinator, ViewControllerRepresentable {

    // MARK: - Internal Properties

    var viewController: UIViewController { navigator.navigationController }

    // MARK: - Private Properties

    private let navigator: Navigatable

    // MARK: - Initialization

    init(dependencies: DependencyContainable) {
        let viewModel = GalleryViewModel()
        let collectionViewController = GalleryCollectionViewController()
        let viewController = GalleryViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)
        self.navigator = Navigator(dependencies: dependencies, navigationController: navigationController)
        super.init()
    }

    // MARK: - Coordinator

    func start() { }
}
