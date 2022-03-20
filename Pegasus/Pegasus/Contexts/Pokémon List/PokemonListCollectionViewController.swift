//
//  PokemonListCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

final class PokemonListCollectionViewController: CollectionViewController {

    // MARK: - Properties

    // MARK: - Initialization

    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }

    // MARK: - Functions

    func setup() {
        self.collectionView.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.07843137255, blue: 0.07843137255, alpha: 1)
    }
}
