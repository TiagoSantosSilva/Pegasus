//
//  CollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

open class CollectionViewController: UICollectionViewController {

    // MARK: - Initialization

    public init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        self.collectionView = CollectionView(frame: .zero, collectionViewLayout: layout)
    }

    override public init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
