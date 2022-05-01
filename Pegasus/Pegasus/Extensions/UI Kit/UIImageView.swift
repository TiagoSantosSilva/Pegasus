//
//  UIImageView.swift
//  Pegasus
//
//  Created by Tiago on 02/05/2022.
//

import UIKit

extension UIImageView{
    func setImage(_ image: UIImage?, animated: Bool = true) {
        let duration = animated ? Constants.SetImageAnimation.animatedDuration : Constants.SetImageAnimation.nonAnimatedDuration
        UIView.transition(with: self,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {
            self.image = image
        },
                          completion: nil)
    }
}

// MARK: - Constants

private enum Constants {
    enum SetImageAnimation {
        static let animatedDuration: TimeInterval = 0.4
        static let nonAnimatedDuration: TimeInterval = 0.0
    }
}
