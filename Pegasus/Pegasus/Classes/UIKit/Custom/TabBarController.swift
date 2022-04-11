//
//  TabBarController.swift
//  Pegasus
//
//  Created by Tiago on 11/04/2022.
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
