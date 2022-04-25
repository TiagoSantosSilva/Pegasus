//
//  UIImage+System.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import UIKit

extension UIImage {
    enum NavigationBar {
        static let refineEmpty: UIImage = UIImage(systemName: "line.3.horizontal.decrease.circle")!
        static let refineFilled: UIImage = UIImage(systemName: "line.3.horizontal.decrease.circle.fill")!
    }
}

extension UIImage {
    enum TabBar {
        static let display: UIImage = .init(systemName: "display")!
        static let gear: UIImage = .init(systemName: "gear")!
        static let photo: UIImage = .init(systemName: "photo.on.rectangle.angled")!
    }
}
