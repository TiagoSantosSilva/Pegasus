//
//  SettingsAboutItem.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsAboutItem: Int, CaseIterable, SettingsItemCellViewModelMappable {
    case instagram
    case twitter
}

extension SettingsAboutItem {
    var name: String {
        switch self {
        case .instagram:
            return "Instagram"
        case .twitter:
            return "Twitter"
        }
    }

    var image: UIImage {
        switch self {
        case .instagram:
            return UIImage.Settings.instagram
        case .twitter:
            return UIImage.Settings.twitter
        }
    }
}
