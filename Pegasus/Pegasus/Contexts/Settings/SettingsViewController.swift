//
//  SettingsViewController.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

final class SettingsViewController: ViewController {

    // MARK: - Properties

    private let collectionViewController: SettingsCollectionViewController
    private let viewModel: SettingsViewModelable

    // MARK: - Initialization

    init(collectionViewController: SettingsCollectionViewController, viewModel: SettingsViewModelable) {
        self.collectionViewController = collectionViewController
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
    }
}
