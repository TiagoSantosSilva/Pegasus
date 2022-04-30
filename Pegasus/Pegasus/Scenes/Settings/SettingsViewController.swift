//
//  SettingsViewController.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func viewController(_ viewController: SettingsViewController, didSelect item: SettingsItemCellViewModel)
}

final class SettingsViewController: ViewController {

    // MARK: - Properties

    weak var delegate: SettingsViewControllerDelegate?

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
        setupNavigationBar()
        setupSubviews()
    }

    // MARK: - Functions

    private func setupNavigationBar() {
        title = Localizable.settings
    }

    private func setupSubviews() {
        add(collectionViewController)
        collectionViewController.setup(with: viewModel.groups)
    }
}
