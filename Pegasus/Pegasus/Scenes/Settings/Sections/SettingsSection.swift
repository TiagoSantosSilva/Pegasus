//
//  SettingsSection.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsSection: Int, CaseIterable {
    case appearance
    case feedback
    case about
}

extension SettingsSection {
    var name: String {
        switch self {
        case .appearance:
            return "Appearance"
        case .feedback:
            return "Feedback"
        case .about:
            return "About"
        }
    }
}

protocol SettingsItemCellViewModelMappable: CaseIterable {
    var name: String { get }
    var image: UIImage { get }
    var cellViewModel: SettingsItemCellViewModel { get }
    static var cellViewModels: [SettingsItemCellViewModel] { get }
}

extension SettingsItemCellViewModelMappable {
    static var cellViewModels: [SettingsItemCellViewModel] {
        allCases.map { $0.cellViewModel }
    }

    var cellViewModel: SettingsItemCellViewModel {
        SettingsItemCellViewModel(name: name, image: image)
    }
}

extension SettingsSection {
    var items: [SettingsItemCellViewModel] {
        switch self {
        case .appearance:
            return SettingsAppearanceItem.cellViewModels
        case .feedback:
            return SettingsFeedbackItem.cellViewModels
        case .about:
            return SettingsAboutItem.cellViewModels
        }
    }
}
