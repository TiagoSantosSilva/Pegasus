//
//  SettingsItemGroupViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import Foundation

struct SettingsItemGroupViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let header: SettingsItemHeaderViewModel
    let items: [SettingsItemCellViewModel]

    // MARK: - Functions

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    static func == (lhs: SettingsItemGroupViewModel, rhs: SettingsItemGroupViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
