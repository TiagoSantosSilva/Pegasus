//
//  SettingsCoordinator.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import MessageUI
import UIKit

final class SettingsCoordinator: Coordinator, ViewControllerRepresentable {

    // MARK: - Internal Properties

    var viewController: UIViewController { navigator.navigationController }

    // MARK: - Private Properties

    private let navigator: Navigator
    private let reducer: SettingsSceneReducer
    private let mailComposeController: EmailOpeningController

    // MARK: - Initialization

    init(dependencies: DependencyContainable, reducer: SettingsSceneReducer) {
        let viewModel = SettingsViewModel()
        let collectionViewController = SettingsCollectionViewController()
        let viewController = SettingsViewController(collectionViewController: collectionViewController, viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: viewController)
        self.navigator = Navigator(navigationController: navigationController)
        self.reducer = reducer
        self.mailComposeController = EmailOpeningController()
        super.init()
        viewController.delegate = self
    }

    // MARK: - Coordinator

    func start() { }
}

final class EmailOpeningController: NSObject {

    private var mailComposerVC: MFMailComposeViewController!

    func openEmail(sendingTo recipient: String, subject: String, in viewController: UIViewController) {
        if MFMailComposeViewController.canSendMail() {

            mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self

            mailComposerVC.setToRecipients([recipient])
            mailComposerVC.setSubject(subject)

            viewController.present(mailComposerVC, animated: true, completion: nil)
        }
    }
}

extension EmailOpeningController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

// MARK: - SettingsViewControllerDelegate

extension SettingsCoordinator: SettingsViewControllerDelegate {
    func viewController(_ viewController: SettingsViewController, didSelect indexPath: IndexPath) {
        print(indexPath)
        reducer.handle(itemAt: indexPath) { action in
            switch action {
            case let .email(email, subject):
                mailComposeController.openEmail(sendingTo: email, subject: subject, in: self.viewController)
            case let .universalLink(link):
                UIApplication.shared.open(link)
                print("\(link.absoluteString) 🍒")
            }
        }
    }
}
