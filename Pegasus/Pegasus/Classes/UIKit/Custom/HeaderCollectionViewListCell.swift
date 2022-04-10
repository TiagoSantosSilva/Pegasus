//
//  HeaderCollectionViewListCell.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import UIKit

final class HeaderCollectionViewListCell: CollectionViewListCell {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Functions

    private func setup() {
        var configuration = defaultContentConfiguration()
        configuration.textProperties.font = .systemFont(ofSize: 14)
        configuration.textProperties.color = .secondaryLabel
        contentConfiguration = configuration
    }
}
