//
//  PokemonDetailsScrollView.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import UIKit

final class PokemonDetailsScrollView: ScrollView {

    // MARK: - Subviews

    private let weightLabel: UILabel = .init()
    private let heightLabel: UILabel = .init()

    // MARK: - Initialization

    override init() {
        super.init()
        setup()
    }

    // MARK: - Functions

    private func setup() {
        add(subviews: weightLabel, heightLabel)
        setupWeightLabel()
        setupHeightLabel()
    }

    private func setupWeightLabel() {
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true

        weightLabel.text = "WEIGHT: 6.9 kg"

        weightLabel.textColor = UIColor.label
    }

    private func setupHeightLabel() {
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: weightLabel.topAnchor).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: weightLabel.trailingAnchor, constant: 16).isActive = true

        heightLabel.text = "HEIGHT: 0.7 m"
        heightLabel.textColor = UIColor.label
    }
}
