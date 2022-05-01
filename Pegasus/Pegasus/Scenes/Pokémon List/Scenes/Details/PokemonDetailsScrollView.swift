//
//  PokemonDetailsScrollView.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import UIKit

final class PokemonDetailsScrollView: ScrollView {

    // MARK: - Subviews

    private let imageView: UIImageView = .init()
    private let weightLabel: UILabel = .init()
    private let heightLabel: UILabel = .init()

    // MARK: - Initialization

    override init() {
        super.init()
        setup()
    }

    // MARK: - Functions

    private func setup() {
        add(subviews: imageView, weightLabel, heightLabel)
        setupImageView()
        setupWeightLabel()
        setupHeightLabel()
    }

    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemIndigo
    }

    private func setupWeightLabel() {
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
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
