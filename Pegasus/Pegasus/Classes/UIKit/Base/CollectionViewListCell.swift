//
//  CollectionViewListCell.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import UIKit

open class CollectionViewListCell: UICollectionViewListCell {

    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
