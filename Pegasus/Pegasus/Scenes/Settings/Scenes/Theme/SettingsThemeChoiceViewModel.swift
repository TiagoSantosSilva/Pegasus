//
//  SettingsThemeChoiceViewModel.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

protocol SettingsThemeChoiceViewModelable {
    var group: SettingsThemeChoiceGroupViewModel { get }

    func didSelect(itemAt row: Int)
}

struct SettingsThemeChoiceViewModel: SettingsThemeChoiceViewModelable {

    // MARK: - Properties

    let group: SettingsThemeChoiceGroupViewModel

    private let applier: SettingsThemeChoiceAppliable

    // MARK: - Initialization

    init(applier: SettingsThemeChoiceAppliable) {
        self.applier = applier
        let selectedTheme = ThemeEnvironment.shared.theme
        self.group = .init(items: SettingsThemeChoiceCellViewModelFactory.makeThemes(selectedTheme: selectedTheme))
    }

    // MARK: - Functions

    func didSelect(itemAt row: Int) {
        guard let theme = SettingsTheme(rawValue: row) else { fatalError() }
        group.items.filter { $0.isSelected }.forEach { $0.isSelected = false }
        group.items[row].isSelected = true
        applier.apply(theme: theme)
    }
}
