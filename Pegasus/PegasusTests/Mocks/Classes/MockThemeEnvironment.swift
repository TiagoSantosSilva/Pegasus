//
//  MockThemeEnvironment.swift
//  PegasusTests
//
//  Created by Tiago on 02/05/2022.
//

import Combine
import UIKit
@testable import Pegasus

final class MockThemeEnvironment: ThemeEnvironmentable {

    // MARK: - Handlers

    var colorHandler: (() -> UIColor)?
    var themeHandler: (() -> SettingsTheme)?
    var themeSubjectHandler: (() -> CurrentValueSubject<SettingsTheme, Never>)?

    // MARK: - Properties

    var color: UIColor {
        guard let handler = colorHandler else { fatalError() }
        return handler()
    }

    var theme: SettingsTheme {
        get {
            guard let handler = themeHandler else { fatalError() }
            return handler()
        }
        set {
            themeHandler = { newValue }
        }
    }

    var themeSubject: CurrentValueSubject<SettingsTheme, Never> {
        guard let handler = themeSubjectHandler else { fatalError() }
        return handler()
    }
}
