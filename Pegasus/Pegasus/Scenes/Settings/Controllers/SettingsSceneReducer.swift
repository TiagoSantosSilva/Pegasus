//
//  SettingsSceneReducer.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

enum SettingsScene {
    case applicationIcon
    case theme
}

enum SettingsSceneReduceAction {
    case email(email: String, subject: String)
    case universalLink(link: URL)
    case scene(SettingsScene)
}

protocol SettingsSceneReduceable {
    func handle(itemAt indexPath: IndexPath, completion: (SettingsSceneReduceAction) -> Void)
}

struct SettingsSceneReducer: SettingsSceneReduceable {

    // MARK: - Functions

    func handle(itemAt indexPath: IndexPath, completion: (SettingsSceneReduceAction) -> Void) {
        guard let section = SettingsSection(rawValue: indexPath.section) else { fatalError() }
        let row = indexPath.row
        switch section {
        case .appearance:
            handleAppearanceItem(at: row, completion: completion)
        case .feedback:
            handleFeedbackItem(at: row, completion: completion)
        case .about:
            handleAboutItem(at: row, completion: completion)
        }
    }

    private func handleAppearanceItem(at row: Int, completion: (SettingsSceneReduceAction) -> Void) {
        guard let item = SettingsAppearanceItem(rawValue: row) else { fatalError() }
        switch item {
        case .icon:
            completion(.scene(.applicationIcon))
        case .theme:
            showErrorMessage("Soon ™️")
        }
    }

    private func handleFeedbackItem(at row: Int, completion: (SettingsSceneReduceAction) -> Void) {
        guard let item = SettingsFeedbackItem(rawValue: row) else { fatalError() }
        switch item {
        case .review:
            showErrorMessage("Soon ™️")
        case .suggestFeature:
            completion(.email(email: Constants.Email.destination, subject: Constants.Email.Feedback.subject))
        case .reportBug:
            completion(.email(email: Constants.Email.destination, subject: Constants.Email.Bug.subject))
        }
    }

    private func handleAboutItem(at row: Int, completion: (SettingsSceneReduceAction) -> Void) {
        guard let item = SettingsAboutItem(rawValue: row) else { fatalError() }
        switch item {
        case .instagram:
            completion(.universalLink(link: URL(staticString: Constants.About.instagram)))
        case .twitter:
            completion(.universalLink(link: URL(staticString: Constants.About.twitter)))
        }
    }
}

// MARK: - Constants

private extension SettingsSceneReducer {
    enum Constants {
        enum Email {
            static let destination: String = "pegasus.app.pokemon.go@gmail.com"

            enum Feedback {
                static let subject: String = "Got a Suggestion"
            }

            enum Bug {
                static let subject: String = "Found a Bug"
            }
        }

        enum About {
            static let instagram: StaticString = "https://www.instagram.com/pegasuspokeapp/"
            static let twitter: StaticString = "https://twitter.com/PegasusPokeApp/"
        }
    }
}

private extension SettingsSceneReducer {
    func showErrorMessage(_ message: String) {
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()

        let alertController = UIAlertController(title: "Feature when?", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: { _ in
            alertWindow.isHidden = true
        }))

        alertWindow.windowLevel = UIWindow.Level.alert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
