//
//  SettingsUniversalLinkController.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol SettingsUniversalLinkControllable: AnyObject {
    func open(_ url: URL)
}

final class SettingsUniversalLinkController: SettingsUniversalLinkControllable {

    // MARK: - Properties

    private weak var application: UIApplication?

    // MARK: - Initialization

    init(application: UIApplication = .shared) {
        self.application = application
    }

    // MARK: - Functions

    func open(_ url: URL) {
        application?.open(url)
    }
}
