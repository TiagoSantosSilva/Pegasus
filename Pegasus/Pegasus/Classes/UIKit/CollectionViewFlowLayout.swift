//
//  CollectionViewFlowLayout.swift
//  Pegasus
//
//  Created by Tiago on 21/03/2022.
//

import UIKit

open class CollectionViewFlowLayout: UICollectionViewFlowLayout {

    // MARK: - Initialization

    public override init() {
        super.init()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
