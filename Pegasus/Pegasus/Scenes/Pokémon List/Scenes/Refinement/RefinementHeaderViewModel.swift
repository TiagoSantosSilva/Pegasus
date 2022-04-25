//
//  RefinementHeaderViewModel.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import Foundation

final class RefinementHeaderViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let name: String
    let type: RefinementSection
    let isMultipleSelectable: Bool
    let items: [RefinementItemCellViewModel]

    // MARK: - Initialization

    init(name: String, type: RefinementSection, isMultipleSelectable: Bool, items: [RefinementItemCellViewModel]) {
        self.name = name
        self.type = type
        self.isMultipleSelectable = isMultipleSelectable
        self.items = items
    }

    // MARK: - Functions

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: RefinementHeaderViewModel, rhs: RefinementHeaderViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
