//
//  SettingsItemHeaderViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import Foundation

struct SettingsItemHeaderViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let name: String

    init(name: String) {
        self.name = name
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    static func == (lhs: SettingsItemHeaderViewModel, rhs: SettingsItemHeaderViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
