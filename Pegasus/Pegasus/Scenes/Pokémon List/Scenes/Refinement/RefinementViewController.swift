//
//  RefinementViewController.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

protocol RefinementViewControllerDelegate: AnyObject {
    func viewController(_ viewController: RefinementViewController,
                        didTap doneButton: UIBarButtonItem,
                        with choices: RefinementChoices)
}

final class RefinementViewController: ViewController {

    // MARK: - Properties

    weak var delegate: RefinementViewControllerDelegate?

    private let collectionViewController: RefinementCollectionViewController
    private let viewModel: RefinementViewModelable

    // MARK: - Initialization

    init(collectionViewController: RefinementCollectionViewController, viewModel: RefinementViewModelable) {
        self.collectionViewController = collectionViewController
        self.viewModel = viewModel
        super.init()
        self.collectionViewController.delegate = self
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
    }

    // MARK: - Functions

    private func setupNavigationBar() {
        let resetButton = UIBarButtonItem(title: Localizable.reset, style: .done, target: self, action: #selector(resetButtonTapped))
        navigationItem.setLeftBarButton(resetButton, animated: false)
        let doneButton = UIBarButtonItem(title: Localizable.done, style: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.setRightBarButton(doneButton, animated: false)

        navigationController?.navigationBar.prefersLargeTitles = false
        title = Localizable.refineTitle
    }

    private func setupSubviews() {
        add(collectionViewController)
        collectionViewController.setup(with: viewModel.sections)
    }

    // MARK: - Selectors

    @objc private func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.viewController(self, didTap: sender, with: viewModel.modeledChoices())
    }

    @objc private func resetButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.resetChoices {
            collectionViewController.setup(with: $0)
        }
    }
}

// MARK: - RefinementCollectionViewControllerDelegate

extension RefinementViewController: RefinementCollectionViewControllerDelegate {
    func collectionViewController(_ collectionViewController: RefinementCollectionViewController, didSelectItemAt indexPath: IndexPath) {
        viewModel.toggle(at: indexPath) { [unowned self] in
            self.collectionViewController.update(items: $0)
        }
    }
}
