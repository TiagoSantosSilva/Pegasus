//
//  SettingsAppearanceItem.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsAppearanceItem: String, CaseIterable, SettingsItemCellViewModelMappable {
    case icon = "Application Icon"
    case theme = "Theme"
}

extension SettingsAppearanceItem {
    var image: UIImage {
        switch self {
        case .icon:
            return UIImage.Settings.icon
        case .theme:
            return UIImage.Settings.theme
        }
    }
}
