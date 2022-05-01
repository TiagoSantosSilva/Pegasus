//
//  ThemeEnvironment.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Combine
import UIKit

protocol ThemeEnvironmentable: AnyObject {
    var color: UIColor { get }
    var theme: SettingsTheme { get set }
    var themeSubject: CurrentValueSubject<SettingsTheme, Never> { get }
}

final class ThemeEnvironment: ThemeEnvironmentable {

    // MARK: - Properties

    var color: UIColor {
        themeSubject.value.color
    }

    var theme: SettingsTheme {
        get {
            themeSubject.value
        }
        set {
            Constants.theme = newValue
            self.themeSubject.send(newValue)
        }
    }

    var themeSubject: CurrentValueSubject<SettingsTheme, Never> = .init(Constants.theme)

    // MARK: - Shared

    static var shared: ThemeEnvironment = .init()

    // MARK: - Initialization

    private init() { }
}

// MARK: - Constants

private extension ThemeEnvironment {
    enum Constants {
        @UserDefault(key: "application_theme", defaultValue: .red)
        static var theme: SettingsTheme
    }
}
