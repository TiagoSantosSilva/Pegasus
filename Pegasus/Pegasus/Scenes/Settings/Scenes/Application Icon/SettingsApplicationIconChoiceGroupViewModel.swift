//
//  SettingsApplicationIconChoiceGroupViewModel.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

struct SettingsApplicationIconChoiceGroupViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = .init()
    let items: [SettingsApplicationIconChoiceCellViewModel]

    // MARK: - Initialization

    init(items: [SettingsApplicationIconChoiceCellViewModel]) {
        self.items = items
    }

    // MARK: - Hashable

    static func == (lhs: SettingsApplicationIconChoiceGroupViewModel, rhs: SettingsApplicationIconChoiceGroupViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
