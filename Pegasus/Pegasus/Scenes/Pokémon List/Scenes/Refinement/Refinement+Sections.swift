//
//  Refinement+Sections.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import Foundation

protocol RefinementItemRepresentable: RawRepresentable where RawValue == String { }

extension RefinementItemRepresentable {
    var name: String { rawValue.firstLetterCapitalized }
}

enum RefinementVariant: String, CaseIterable, Equatable, RefinementItemRepresentable {
    case normal 
    case shiny
}

enum RefinementOrder: String, CaseIterable, Equatable, RefinementItemRepresentable {
    case nameAscending = "Name Ascending"
    case nameDescending = "Name Descending"
    case numberAscending = "Number Ascending"
    case numberDescending = "Number Descending"
}

enum RefinementRegion: String, CaseIterable, Equatable, RefinementItemRepresentable {
    case kanto
    case johto
    case hoenn
    case sinnoh
    case unova
    case kalos
    case galar
    case spain
}

enum RefinementAvailability: String, CaseIterable, Equatable, RefinementItemRepresentable {
    case all
    case available
    case unavailable
}
