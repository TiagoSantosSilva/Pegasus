//
//  RefinementSection.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import Foundation

enum RefinementSection: String, CaseIterable {
    case variant
    case availability
    case order
    case region
}

extension RefinementSection {
    // MARK: - Static Properties

    static var headers: [RefinementHeaderViewModel] {
        allCases.map { RefinementHeaderViewModel(name: $0.rawValue.firstLetterCapitalized, type: $0, isMultipleSelectable: $0.isMultipleSelectable, items: $0.items) }
    }

    // MARK: - Properties
    
    var header: RefinementHeaderViewModel {
        RefinementHeaderViewModel(name: rawValue.firstLetterCapitalized, type: self, isMultipleSelectable: isMultipleSelectable, items: items)
    }

    var items: [RefinementItemCellViewModel] {
        switch self {
        case .variant:
            return RefinementVariant.refinementItems
        case .availability:
            return RefinementAvailability.refinementItems
        case .order:
            return RefinementOrder.refinementItems
        case .region:
            return RefinementRegion.refinementItems
        }
    }

    var isMultipleSelectable: Bool {
        switch self {
        case .variant, .order, .availability: return false
        case .region: return true
        }
    }
}
