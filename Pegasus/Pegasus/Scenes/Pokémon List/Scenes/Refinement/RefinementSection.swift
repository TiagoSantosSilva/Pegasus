//
//  RefinementSection.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import Foundation

enum RefinementSection: String, CaseIterable {
    case variant
    case availability = "Availability 🍒"
    case order
    case region
}

extension RefinementSection {
    // MARK: - Properties

    var isMultipleSelectable: Bool {
        switch self {
        case .variant, .order, .availability: return false
        case .region: return true
        }
    }
}
