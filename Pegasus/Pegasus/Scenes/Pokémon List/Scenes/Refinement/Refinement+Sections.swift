//
//  Refinement+Sections.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import Foundation

enum RefinementVariant: String, CaseIterable, RefinementItemCellViewModelMappable {
    case normal 
    case shiny
}

extension RefinementVariant {
    var isSelected: Bool {
        switch self {
        case .normal: return true
        case .shiny: return false
        }
    }
}

enum RefinementOrder: String, CaseIterable, RefinementItemCellViewModelMappable {
    case nameAscending = "Name Ascending"
    case nameDescending = "Name Descending"
    case numberAscending = "Number Ascending"
    case numberDescending = "Number Descending"
}

extension RefinementOrder {
    var isSelected: Bool {
        switch self {
        case .numberAscending: return true
        case .numberDescending,
                .nameAscending,
                .nameDescending: return false
        }
    }
}

enum RefinementRegion: String, CaseIterable, RefinementItemCellViewModelMappable {
    case kanto
    case johto
    case hoenn
    case sinnoh
    case unova
    case kalos
    case galar
    case spain
}

extension RefinementRegion {
    var isSelected: Bool {
        true
    }
}

enum RefinementAvailability: String, CaseIterable, RefinementItemCellViewModelMappable {
    case all
    case available
    case unavailable
}

extension RefinementAvailability {
    var isSelected: Bool {
        switch self {
        case .all: return true
        case .available,
                .unavailable: return false
        }
    }
}
