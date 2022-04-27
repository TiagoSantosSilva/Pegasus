//
//  UIViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

public extension UIViewController {
    func add(_ child: UIViewController) {
        view.addSubview(child.view)
        addChild(child)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
