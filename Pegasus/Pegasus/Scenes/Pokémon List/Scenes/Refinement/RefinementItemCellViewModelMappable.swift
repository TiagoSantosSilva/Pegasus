//
//  RefinementItemCellViewModelMappable.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import Foundation

protocol RefinementItemCellViewModelMappable: CaseIterable, RawRepresentable where RawValue == String {
    static var refinementItems: [RefinementItemCellViewModel] { get }

    var isSelected: Bool { get }
}

extension RefinementItemCellViewModelMappable {
    static var refinementItems: [RefinementItemCellViewModel] {
        allCases.map { RefinementItemCellViewModel(name: $0.rawValue.firstLetterCapitalized, type: Self.self, isSelected: $0.isSelected) }
    }
}
