//
//  CollectionReusableView.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

open class CollectionReusableView: UICollectionReusableView {

    // MARK: - Initialization

    public override init(frame: CGRect) {
        super.init(frame: frame)
        stylize()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    private func stylize() {
        backgroundColor = Color.background
    }
}
