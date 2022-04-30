//
//  SettingsAppearanceItem.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsAppearanceItem: Int, CaseIterable, SettingsItemCellViewModelMappable {
    case icon
    case theme
}

extension SettingsAppearanceItem {
    var name: String {
        switch self {
        case .icon:
            return "Application Icon"
        case .theme:
            return "Theme"
        }
    }

    var image: UIImage {
        switch self {
        case .icon:
            return UIImage.Settings.icon
        case .theme:
            return UIImage.Settings.theme
        }
    }
}
