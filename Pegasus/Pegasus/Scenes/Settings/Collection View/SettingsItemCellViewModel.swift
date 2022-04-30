//
//  SettingsItemCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

struct SettingsItemCellViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = UUID()
    let name: String
    let image: UIImage

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    static func == (lhs: SettingsItemCellViewModel, rhs: SettingsItemCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
