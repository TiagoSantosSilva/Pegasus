//
//  NSDirectionalEdgeInsets.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

extension NSDirectionalEdgeInsets {
    init(withEqualValue inset: CGFloat) {
        self.init(top: inset,
                  leading: inset,
                  bottom: inset,
                  trailing: inset)
    }
}
