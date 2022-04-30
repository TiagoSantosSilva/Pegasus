//
//  SettingsFeedbackItem.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsFeedbackItem: String, CaseIterable, SettingsItemCellViewModelMappable {
    case review = "Leave us a review"
    case suggestFeature = "Suggest a new feature"
    case reportBug = "Report a bug"
}

extension SettingsFeedbackItem {
    var image: UIImage {
        switch self {
        case .review:
            return UIImage.Settings.review
        case .suggestFeature:
            return UIImage.Settings.feedback
        case .reportBug:
            return UIImage.Settings.bug
        }
    }
}
