//
//  SettingsAboutItem.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsAboutItem: String, CaseIterable, SettingsItemCellViewModelMappable {
    case instagram = "Instagram"
    case twitter = "Twitter"
}

extension SettingsAboutItem {
    var image: UIImage {
        switch self {
        case .instagram:
            return UIImage.Settings.instagram
        case .twitter:
            return UIImage.Settings.twitter
        }
    }
}
