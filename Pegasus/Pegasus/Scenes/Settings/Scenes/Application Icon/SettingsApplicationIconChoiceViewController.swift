//
//  SettingsApplicationIconChoiceViewController.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol SettingsApplicationIconChoiceViewControllerDelegate: AnyObject {
    func viewController(_ viewController: SettingsApplicationIconChoiceViewController, didSelect indexPath: IndexPath)
}

final class SettingsApplicationIconChoiceViewController: ViewController {

    // MARK: - Properties

    weak var delegate: SettingsApplicationIconChoiceViewControllerDelegate?

    private let collectionViewController: SettingsApplicationIconChoiceCollectionViewController
    private let viewModel: SettingsApplicationIconChoiceViewModelable

    // MARK: - Initialization

    init(collectionViewController: SettingsApplicationIconChoiceCollectionViewController,
         viewModel: SettingsApplicationIconChoiceViewModelable) {
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
        title = Localizable.applicationIcon
    }

    private func setupSubviews() {
        add(collectionViewController)
        collectionViewController.setup(with: viewModel.groups)
    }
}

// MARK: - SettingsCollectionViewControllerDelegate

extension SettingsApplicationIconChoiceViewController: SettingsApplicationIconChoiceCollectionViewControllerDelegate {
    func collectionViewController(_ collectionViewController: SettingsApplicationIconChoiceCollectionViewController,
                                  didSelectItemAt indexPath: IndexPath) {
        delegate?.viewController(self, didSelect: indexPath)

        guard let icon = SettingsApplicationIcon(rawValue: indexPath.row) else { fatalError() }
        UIApplication.showErrorMessage(title: "Icon chosen", message: icon.name)
    }
}
