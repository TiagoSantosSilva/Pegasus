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
    let type: Any.Type
    var isSelected: Bool

    // MARK: - Initialization

    init(name: String, type: Any.Type, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
        self.type = type
    }

    // MARK: - Functions

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: RefinementItemCellViewModel, rhs: RefinementItemCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid && lhs.isSelected == rhs.isSelected
    }
}
