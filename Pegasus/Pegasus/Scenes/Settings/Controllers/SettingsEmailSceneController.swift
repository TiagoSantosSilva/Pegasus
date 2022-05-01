//
//  SettingsEmailSceneController.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import MessageUI
import UIKit

protocol SettingsEmailSceneControllable {
    func openEmail(sendingTo recipient: String, subject: String, in viewController: UIViewController)
}

final class SettingsEmailSceneController: NSObject, SettingsEmailSceneControllable {

    // MARK: - Functions

    func openEmail(sendingTo recipient: String, subject: String, in viewController: UIViewController) {
        guard MFMailComposeViewController.canSendMail() else { return }

        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = self

        mailComposeViewController.setToRecipients([recipient])
        mailComposeViewController.setSubject(subject)

        viewController.present(mailComposeViewController, animated: true, completion: nil)
    }
}

// MARK: - MFMailComposeViewControllerDelegate

extension SettingsEmailSceneController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
