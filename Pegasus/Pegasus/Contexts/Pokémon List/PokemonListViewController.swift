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
    
    // MARK: - Initialization
    
    init(collectionViewController: PokemonListCollectionViewController) {
        self.collectionViewController = collectionViewController
        super.init()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pegasus"
        setupSubviews()
    }
    
    // MARK: - Setups
    
    private func setupSubviews() {
        setupCollectionViewController()
    }
    
    private func setupCollectionViewController() {
        add(collectionViewController)
        collectionViewController.setup()
    }
}
