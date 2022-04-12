//
//  PokemonListCollectionView.swift
//  Pegasus
//
//  Created by Tiago on 21/03/2022.
//

import UIKit

final class PokemonListCollectionView: CollectionView {

    // MARK: - Properties

    var layoutDelegate: PokemonListCollectionViewLayoutProxyDelegate? {
        get {
            layout.delegate
        }
        set {
            layout.delegate = newValue
        }
    }

    private let layout: PokemonListCollectionViewLayoutProxy

    // MARK: - Initialization

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        self.layout = PokemonListCollectionViewLayoutProxy()
        super.init(frame: frame, collectionViewLayout: layout)
    }
}
