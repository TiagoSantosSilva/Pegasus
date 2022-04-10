//
//  CollectionViewCompositionalLayout.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import UIKit

open class CollectionViewCompositionalLayout: UICollectionViewCompositionalLayout {

    // MARK: - Initialization

    override public init(section: NSCollectionLayoutSection) {
        super.init(section: section)
    }

    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
