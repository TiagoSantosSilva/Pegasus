//
//  SettingsCell.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

final class SettingsCell: CollectionViewListCell {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Functions

    func configure(with item: SettingsItemCellViewModel) {
        var configuration = defaultContentConfiguration()
        configuration.text = item.name
        configuration.image = item.image
        contentConfiguration = configuration
        tintColor = .tint
    }

    // MARK: - Setups

    private func setup() {
        var configuration = defaultContentConfiguration()
        configuration.textProperties.color = .label
        contentConfiguration = configuration
        tintColor = .tint
    }
}
