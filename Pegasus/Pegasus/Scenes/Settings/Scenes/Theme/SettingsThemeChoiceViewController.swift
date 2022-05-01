//
//  SettingsThemeChoiceViewController.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol SettingsThemeChoiceViewControllerDelegate: AnyObject {
    func viewController(_ viewController: SettingsThemeChoiceViewController, didSelect indexPath: IndexPath)
}

final class SettingsThemeChoiceViewController: ViewController {

    // MARK: - Properties

    weak var delegate: SettingsThemeChoiceViewControllerDelegate?

    private let collectionViewController: SettingsThemeChoiceCollectionViewController
    private let viewModel: SettingsThemeChoiceViewModelable

    // MARK: - Initialization

    init(collectionViewController: SettingsThemeChoiceCollectionViewController,
         viewModel: SettingsThemeChoiceViewModelable) {
        self.collectionViewController = collectionViewController
        self.viewModel = viewModel
        super.init()
        collectionViewController.delegate = self
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
    }

    // MARK: - Functions

    private func setupNavigationBar() {
        title = Localizable.theme
    }

    private func setupSubviews() {
        add(collectionViewController)
    }
}

// MARK: - SettingsCollectionViewControllerDelegate

extension SettingsThemeChoiceViewController: SettingsThemeChoiceCollectionViewControllerDelegate {
    func collectionViewController(_ collectionViewController: SettingsThemeChoiceCollectionViewController,
                                  didSelectItemAt indexPath: IndexPath) {
        delegate?.viewController(self, didSelect: indexPath)
    }
}
