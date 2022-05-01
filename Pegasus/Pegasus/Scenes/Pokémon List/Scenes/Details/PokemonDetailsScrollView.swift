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

    func configure(with image: UIImage?) {
        imageView.setImage(image)
    }
    
    // MARK: - Private Functions

    private func setup() {
        add(subviews: imageView, weightLabel, heightLabel)
        setupImageView()
        setupWeightLabel()
        setupHeightLabel()
    }

    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constraints.ImageView.top).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constraints.ImageView.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constraints.ImageView.height).isActive = true
        imageView.contentMode = .scaleAspectFit
    }

    private func setupWeightLabel() {
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constraints.WeightLabel.top).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.WeightLabel.leading).isActive = true

        weightLabel.text = "WEIGHT: 6.9 kg"

        weightLabel.textColor = UIColor.label
    }

    private func setupHeightLabel() {
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: weightLabel.topAnchor).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: weightLabel.trailingAnchor, constant: Constraints.HeightLabel.trailing).isActive = true

        heightLabel.text = "HEIGHT: 0.7 m"
        heightLabel.textColor = UIColor.label
    }
}

// MARK: - Constants

private extension PokemonDetailsScrollView {
    enum Constraints {
        enum ImageView {
            static let top: CGFloat = 32
            static let width: CGFloat = 200
            static let height: CGFloat = 200
        }

        enum WeightLabel {
            static let top: CGFloat = 16
            static let leading: CGFloat = 16
        }

        enum HeightLabel {
            static let trailing: CGFloat = 16
        }
    }
}
