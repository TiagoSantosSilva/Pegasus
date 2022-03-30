//
//  PokemonListViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

protocol PokemonListViewControllerDelegate: AnyObject {
    func viewController(_ viewController: PokemonListViewController, didTap refinementButton: UIBarButtonItem)
}

final class PokemonListViewController: ViewController {

    // MARK: - Properties

    weak var delegate: PokemonListViewControllerDelegate?

    private let collectionViewController: PokemonListCollectionViewController
    private let viewModel: PokemonListViewModelable

    // MARK: - Initialization

    init(collectionViewController: PokemonListCollectionViewController, viewModel: PokemonListViewModelable) {
        self.collectionViewController = collectionViewController
        self.viewModel = viewModel
        super.init()
        self.collectionViewController.dataRepresentable = viewModel
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
        setupData()
    }

    // MARK: - Setups

    private func setupNavigationBar() {
        title = "Pegasus"
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage.NavigationBar.refine,
                                                         style: .plain,
                                                         target: self,
                                                         action: #selector(refinementButtonTapped)),
                                         animated: false)
    }

    private func setupSubviews() {
        add(collectionViewController)
    }

    private func setupData() {
        viewModel.loadRegions { [weak self] in
            guard let self = self else { return }
            switch $0 {
            case .success:
                self.collectionViewController.update(with: self.viewModel.regions, and: self.viewModel.pokemon)
            case .error:
                print("ERROR")
            }
        }
    }

    // MARK: - Selectors
    
    @objc private func refinementButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.viewController(self, didTap: sender)
    }
}
