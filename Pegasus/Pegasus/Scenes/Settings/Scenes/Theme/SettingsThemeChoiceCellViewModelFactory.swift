//
//  SettingsThemeChoiceCellViewModelFactory.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

enum SettingsThemeChoiceCellViewModelFactory {

    // MARK: - Functions

    static func makeThemes(selectedTheme: SettingsTheme) -> [SettingsThemeChoiceCellViewModel] {
        SettingsTheme.allCases.map {
            let isSelected = $0 == selectedTheme
            return SettingsThemeChoiceCellViewModel(name: $0.name, image: $0.image, isSelected: isSelected)
        }
    }
}
