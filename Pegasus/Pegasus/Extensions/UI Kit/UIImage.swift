//
//  UIImage.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

extension UIImage {
    static func make(color: UIColor, size: CGSize = .init(width: 48, height: 48)) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
