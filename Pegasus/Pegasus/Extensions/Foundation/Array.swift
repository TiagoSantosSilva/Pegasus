//
//  Array.swift
//  Pegasus
//
//  Created by Tiago on 08/05/2022.
//

import Foundation

extension Array {
    var hasOnlyOneElement: Bool {
        count == 1
    }

    subscript(safe index: Int) -> Element? {
        guard count >= index + 1 else { return nil }
        return self[index]
    }
}
