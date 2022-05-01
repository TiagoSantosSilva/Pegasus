//
//  SettingsThemeChoiceCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

struct SettingsThemeChoiceCellViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = .init()
    let name: String
    let image: UIImage

    // MARK: - Hashable

    static func == (lhs: SettingsThemeChoiceCellViewModel, rhs: SettingsThemeChoiceCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
