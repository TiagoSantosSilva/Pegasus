//
//  PokemonListViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

final class PokemonListViewController: ViewController {

    // MARK: - Properties

    private let collectionViewController: PokemonListCollectionViewController
    private let viewModel: PokemonListViewModelable

    // MARK: - Initialization

    init(collectionViewController: PokemonListCollectionViewController, viewModel: PokemonListViewModelable) {
        self.collectionViewController = collectionViewController
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pegasus"
        setupSubviews()

        viewModel.loadPokemon { [weak self] in
            guard let self = self else { return }
            switch $0 {
            case .success:
                self.viewModel.pokemon.forEach { pokemon in
                    print("\(pokemon.number)")
                }
                self.collectionViewController.update(with: self.viewModel.pokemon)
            case .error:
                print("ERROR")
            }
        }
    }

    // MARK: - Setups

    private func setupSubviews() {
        add(collectionViewController)
    }
}
