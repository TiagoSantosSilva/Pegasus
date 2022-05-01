//
//  SettingsThemeChoiceApplier.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

protocol SettingsThemeChoiceAppliable {
    func apply(theme: SettingsTheme)
}

final class SettingsThemeChoiceApplier: SettingsThemeChoiceAppliable {

    // MARK: - Properties

    private let environment: ThemeEnvironmentable

    // MARK: - Initialization

    init(environment: ThemeEnvironmentable) {
        self.environment = environment
    }

    // MARK: - Functions

    func apply(theme: SettingsTheme) {
        environment.theme = theme
    }
}
