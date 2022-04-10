//
//  RefinementViewController.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

protocol RefinementViewControllerDelegate: AnyObject {
    func viewController(_ viewController: RefinementViewController, didTap doneButton: UIBarButtonItem)
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
        let button = UIBarButtonItem(title: Localizable.done, style: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.setRightBarButton(button, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = false
        title = Localizable.refinementTitle
    }

    private func setupSubviews() {
        add(collectionViewController)
        collectionViewController.setup(with: viewModel.sections)
    }

    // MARK: - Selectors

    @objc private func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.viewController(self, didTap: sender)
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
