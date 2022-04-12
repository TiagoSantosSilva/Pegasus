//
//  RefinementListCell.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import UIKit

final class RefinementListCell: CollectionViewListCell {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Functions

    func configure(with item: RefinementItemCellViewModel) {
        var configuration = defaultContentConfiguration()
        configuration.text = item.name
        contentConfiguration = configuration
        self.accessories = item.isSelected ? [.checkmark()] : []
    }

    // MARK: - Setups

    private func setup() {
        var configuration = defaultContentConfiguration()
        configuration.textProperties.color = .label
        contentConfiguration = configuration
        tintColor = .tint
    }
}
