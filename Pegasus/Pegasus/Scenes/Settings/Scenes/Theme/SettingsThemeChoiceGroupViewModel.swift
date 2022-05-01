//
//  SettingsThemeChoiceGroupViewModel.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

struct SettingsThemeChoiceGroupViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = .init()
    let items: [SettingsThemeChoiceCellViewModel]

    // MARK: - Initialization

    init(items: [SettingsThemeChoiceCellViewModel]) {
        self.items = items
    }

    // MARK: - Hashable

    static func == (lhs: SettingsThemeChoiceGroupViewModel, rhs: SettingsThemeChoiceGroupViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
