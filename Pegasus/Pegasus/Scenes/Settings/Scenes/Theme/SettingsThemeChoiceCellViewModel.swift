//
//  SettingsThemeChoiceCellViewModel.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

final class SettingsThemeChoiceCellViewModel: Hashable {

    // MARK: - Properties

    let uuid: UUID = .init()
    let name: String
    let image: UIImage
    var isSelected: Bool

    // MARK: - Initialization

    init(name: String, image: UIImage, isSelected: Bool) {
        self.name = name
        self.image = image
        self.isSelected = isSelected
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: SettingsThemeChoiceCellViewModel, rhs: SettingsThemeChoiceCellViewModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
