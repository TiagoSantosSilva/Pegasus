//
//  CATransition.swift
//  Pegasus
//
//  Created by Tiago on 08/04/2022.
//

import UIKit

extension CATransition {
    static let fade: CATransition = {
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.duration = 0.2
        return transition
    }()
}
