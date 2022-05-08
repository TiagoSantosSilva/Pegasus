//
//  PokemonDetailsStatsStackView.swift
//  Pegasus
//
//  Created by Tiago on 08/05/2022.
//

import UIKit

final class PokemonDetailsStatsStackView: StackView {

    // MARK: - Subviews

    private let valueLabel: UILabel = .init()
    private let nameLabel: UILabel = .init()

    // MARK: - Initialization

    init() {
        super.init(subviews: [valueLabel, nameLabel])
        setupStackView()
    }

    // MARK: - Configurations

    func configure(with value: String, for stat: PokemonDetailsStat) {
        self.valueLabel.text = value
        self.nameLabel.text = stat.rawValue
    }

    // MARK: - Functions

    private func setupStackView() {
        axis = .vertical
        distribution = .fill
        spacing = Constants.StackView.spacing
        
        setupValueLabel()
        setupNameLabel()
    }

    private func setupValueLabel() {
        valueLabel.textColor = Constants.Colors.value
        valueLabel.font = Constants.Fonts.value
        valueLabel.textAlignment = .center
    }

    private func setupNameLabel() {
        nameLabel.textColor = Constants.Colors.name
        nameLabel.font = Constants.Fonts.name
        nameLabel.textAlignment = .center
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        nameLabel.setContentCompressionResistancePriority(.init(rawValue: 1000), for: .horizontal)
    }
}

// MARK: - Constants

private extension PokemonDetailsStatsStackView {
    enum Constants {
        enum Fonts {
            static let value: UIFont = .systemFont(ofSize: 16, weight: .bold)
            static let name: UIFont = .systemFont(ofSize: 11, weight: .bold)
        }

        enum Colors {
            static let value: UIColor = .label
            static let name: UIColor = .secondaryLabel
        }

        enum StackView {
            static let spacing: CGFloat = 4
        }
    }
}
