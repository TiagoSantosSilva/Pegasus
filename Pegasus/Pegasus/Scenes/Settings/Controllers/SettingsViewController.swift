//
//  SettingsViewController.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func viewController(_ viewController: SettingsViewController, didSelect indexPath: IndexPath)
}

final class SettingsViewController: ViewController {

    // MARK: - Properties

    weak var delegate: SettingsViewControllerDelegate?

    private let collectionViewController: SettingsCollectionViewController
    private let viewModel: SettingsViewModelable

    // MARK: - Initialization

    init(dependencies: DependencyContainable,
         collectionViewController: SettingsCollectionViewController,
         viewModel: SettingsViewModelable) {
        self.collectionViewController = collectionViewController
        self.viewModel = viewModel
        super.init()
        collectionViewController.delegate = self
        dependencies.themeEnvironment.subscribe(self)
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

// MARK: - SettingsCollectionViewControllerDelegate

extension SettingsViewController: SettingsCollectionViewControllerDelegate {
    func collectionViewController(_ collectionViewController: SettingsCollectionViewController, didSelectItemAt indexPath: IndexPath) {
        delegate?.viewController(self, didSelect: indexPath)
    }
}

// MARK: - ThemeEnvironmentDelegate

extension SettingsViewController: ThemeEnvironmentDelegate {
    func themeEnvironment(_ themeEnvironment: ThemeEnvironment, didChangeColor color: UIColor) {
        viewModel.reloadGroups()
        collectionViewController.reload()
    }
}
