//
//  ThemeEnvironment.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol ThemeEnvironmentDelegate: AnyObject {
    func themeEnvironment(_ themeEnvironment: ThemeEnvironment, didChangeColor color: UIColor)
}

protocol ThemeEnvironmentable: AnyObject {
    var color: UIColor { get }
    var theme: SettingsTheme { get set }

    func subscribe(_ delegate: ThemeEnvironmentDelegate)
}

final class ThemeEnvironment: ThemeEnvironmentable {

    // MARK: - Properties

    var color: UIColor {
        theme.color
    }

    var theme: SettingsTheme {
        get {
            Constants.theme
        }
        set {
            Constants.theme = newValue
            multicastDelegate.invokeDelegates { $0.themeEnvironment(self, didChangeColor: newValue.color) }
        }
    }

    // MARK: - Shared

    static var shared: ThemeEnvironment = .init()

    // MARK: - Private Properties

    private let multicastDelegate = MulticastDelegate<ThemeEnvironmentDelegate>()

    // MARK: - Initialization

    private init() { }

    // MARK: - Functions

    func subscribe(_ delegate: ThemeEnvironmentDelegate) {
        multicastDelegate.addDelegate(delegate)
    }
}

// MARK: - Constants

private extension ThemeEnvironment {
    enum Constants {
        @UserDefault(key: "application_theme", defaultValue: .red)
        static var theme: SettingsTheme
    }
}
