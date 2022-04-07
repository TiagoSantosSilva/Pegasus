//
//  PokemonListViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

protocol PokemonListViewControllerDelegate: AnyObject {
    func viewController(_ viewController: PokemonListViewController, didTap refinementButton: UIBarButtonItem)
    func viewController(_ viewController: PokemonListViewController, didSelect pokemon: PokemonListCellViewModel)
}

final class PokemonListViewController: ViewController {

    // MARK: - Properties

    weak var delegate: PokemonListViewControllerDelegate?

    private let collectionViewController: PokemonListCollectionViewController
    private let searchController: PokemonListSearchController
    private let viewModel: PokemonListViewModelable

    // MARK: - Initialization

    init(collectionViewController: PokemonListCollectionViewController,
         searchController: PokemonListSearchController,
         viewModel: PokemonListViewModelable) {
        self.collectionViewController = collectionViewController
        self.searchController = searchController
        self.viewModel = viewModel
        super.init()
        self.collectionViewController.delegate = self
        self.collectionViewController.dataRepresentable = viewModel

        setupSearchBar()
        setupNavigationBar()
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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

    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }

    private func setupSubviews() {
        add(collectionViewController)
    }

    private func setupData() {
        viewModel.loadRegions { [unowned self] in
            switch $0 {
            case .success:
                self.collectionViewController.update(with: self.viewModel.regions, and: self.viewModel.pokemon)
            case .error:
                fatalError()
            }
        }
    }

    // MARK: - Selectors
    
    @objc private func refinementButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.viewController(self, didTap: sender)
    }
}

// MARK: - Pokemon List Collection View Controller Delegate

extension PokemonListViewController: PokemonListCollectionViewControllerDelegate {
    func collectionViewController(_ collectionViewController: PokemonListCollectionViewController, didSelectItemAt indexPath: IndexPath) {
        guard let pokemon = viewModel.pokemon[indexPath.section]?[indexPath.row] else { return }
        delegate?.viewController(self, didSelect: pokemon)
    }
}

// MARK: - UI Search Results Updating

extension PokemonListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print("\(#function) \(String(describing: searchController.searchBar.text))")
        viewModel.search(for: text) { [unowned self] in
            self.collectionViewController.update(with: self.viewModel.regions, and: self.viewModel.pokemon)
        }
    }
}
