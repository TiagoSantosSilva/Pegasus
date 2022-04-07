//
//  CollectionViewCell.swift
//  Pegasus
//
//  Created by Tiago on 08/04/2022.
//

import UIKit

open class CollectionViewCell: UICollectionViewCell {

    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    private func setupStyle() {
        backgroundColor = Color.cell
    }
}
