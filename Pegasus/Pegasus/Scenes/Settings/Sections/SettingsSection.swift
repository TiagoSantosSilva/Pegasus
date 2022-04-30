//
//  SettingsSection.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsSection: String, CaseIterable {
    case appearance
    case feedback
    case about
}

protocol SettingsItemCellViewModelMappable: CaseIterable, RawRepresentable where RawValue == String {
    var image: UIImage { get }
    var cellViewModel: SettingsItemCellViewModel { get }
    static var cellViewModels: [SettingsItemCellViewModel] { get }
}

extension SettingsItemCellViewModelMappable {
    static var cellViewModels: [SettingsItemCellViewModel] {
        allCases.map { $0.cellViewModel }
    }

    var cellViewModel: SettingsItemCellViewModel {
        SettingsItemCellViewModel(name: rawValue, image: image)
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
