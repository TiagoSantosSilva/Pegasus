//
//  UIColor.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red)/Self.divisor, green: CGFloat(green)/Self.divisor, blue: CGFloat(blue)/Self.divisor, alpha: alpha)
    }
}

private extension UIColor {
    static let divisor: CGFloat = 255
}

extension UIColor {
    static var tint: UIColor {
        .systemRed
    }
}
