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

    // MARK: - Initialization

    init(viewModel: RefinementViewModelable) {
        super.init()
        title = "Rearrange"
        setup()
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    // MARK: - Functions

    private func setup() {
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped)), animated: false)
    }

    // MARK: - Selectors

    @objc private func doneButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.viewController(self, didTap: sender)
    }
}
