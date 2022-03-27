//
//  UIView.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import UIKit

extension UIView {
    func round() {
        clipsToBounds = true
        layer.cornerRadius = 10
    }
}
