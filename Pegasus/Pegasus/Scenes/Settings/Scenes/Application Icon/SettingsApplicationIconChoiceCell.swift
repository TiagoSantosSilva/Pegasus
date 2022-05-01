//
//  SettingsApplicationIconChoiceCell.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

final class SettingsApplicationIconChoiceCell: CollectionViewListCell {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Functions

    func configure(with viewModel: SettingsApplicationIconChoiceCellViewModel) {
        var configuration = defaultContentConfiguration()
        configuration.text = viewModel.name
        configuration.image = viewModel.image
        configuration.imageProperties.cornerRadius = Constants.cornerRadius
        contentConfiguration = configuration
    }

    // MARK: - Setups

    private func setup() {
        var configuration = defaultContentConfiguration()
        configuration.textProperties.color = .label
        contentConfiguration = configuration
        tintColor = .tint
    }
}

// MARK: - Constants

private extension SettingsApplicationIconChoiceCell {
    enum Constants {
        static let cornerRadius: CGFloat = 8
    }
}
