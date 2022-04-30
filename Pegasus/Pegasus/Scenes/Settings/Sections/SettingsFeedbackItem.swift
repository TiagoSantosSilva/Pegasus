//
//  SettingsFeedbackItem.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsFeedbackItem: Int, CaseIterable, SettingsItemCellViewModelMappable {
    case review
    case suggestFeature
    case reportBug
}

extension SettingsFeedbackItem {
    var name: String {
        switch self {
        case .review:
            return "Leave us a review"
        case .suggestFeature:
            return "Suggest a New Feature or Improvement"
        case .reportBug:
            return "Report a Problem"
        }
    }

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
