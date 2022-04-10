//
//  RefinementItemCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import Foundation

final class RefinementItemCellViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let name: String
    var isSelected: Bool

    // MARK: - Initialization

    init(name: String, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }

    // MARK: - Functions

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: RefinementItemCellViewModel, rhs: RefinementItemCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid && lhs.isSelected == rhs.isSelected
    }
}
