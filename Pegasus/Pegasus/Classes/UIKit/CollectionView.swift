//
//  CollectionView.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

open class CollectionView: UICollectionView {

    // MARK: - Initialization

    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Setups

    private func setup() {
        backgroundColor = Color.background
    }
}
