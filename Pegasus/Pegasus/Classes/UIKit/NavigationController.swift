//
//  NavigationController.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

final class NavigationController: UINavigationController {
    
    // MARK: - Initialization
    
    override init(rootViewController: UIViewController) {
        super.init(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        self.setViewControllers([rootViewController], animated: false)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
