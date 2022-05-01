//
//  SettingsViewController.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import Combine
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
        
        setupThemeChangeHandling(dependencies: dependencies)
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

    private func setupThemeChangeHandling(dependencies: DependencyContainable) {
        dependencies.themeEnvironment.themeSubject.sink { [weak self] _ in
            self?.viewModel.reloadGroups()
            self?.collectionViewController.reload()
        }.store(in: &CancellableStorage.shared.cancellables)
    }
}

// MARK: - SettingsCollectionViewControllerDelegate

extension SettingsViewController: SettingsCollectionViewControllerDelegate {
    func collectionViewController(_ collectionViewController: SettingsCollectionViewController, didSelectItemAt indexPath: IndexPath) {
        delegate?.viewController(self, didSelect: indexPath)
    }
}
