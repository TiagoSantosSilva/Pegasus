//
//  SettingsThemeChoiceCell.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

final class SettingsThemeChoiceCell: CollectionViewListCell {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Functions

    func configure(with viewModel: SettingsThemeChoiceCellViewModel) {
        var configuration = defaultContentConfiguration()
        configuration.text = viewModel.name
        configuration.image = viewModel.image
        configuration.imageProperties.cornerRadius = Constants.cornerRadius
        contentConfiguration = configuration
        accessories = viewModel.isSelected ? [.checkmark()] : []
    }

    // MARK: - Setups

    private func setup() {
        var configuration = defaultContentConfiguration()
        configuration.textProperties.color = .label
        contentConfiguration = configuration
        tintColor = .systemRed
    }
}

// MARK: - Constants

private extension SettingsThemeChoiceCell {
    enum Constants {
        static let cornerRadius: CGFloat = 4
    }
}
