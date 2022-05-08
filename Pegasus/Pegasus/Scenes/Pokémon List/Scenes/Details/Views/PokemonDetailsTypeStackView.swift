//
//  PokemonDetailsTypeStackView.swift
//  Pegasus
//
//  Created by Tiago on 08/05/2022.
//

import UIKit

final class PokemonDetailsTypeStackView: View {

    // MARK: - Subviews

    private let imageView: UIImageView = .init()
    private let nameLabel: UILabel = .init()

    // MARK: - Initialization

    override init() {
        super.init()
        setupView()
        setupNameLabel()
        setupImageView()
    }

    // MARK: - Configuration

    func configure(with type: PokemonTypeViewModel) {
        nameLabel.text = type.name
        imageView.image = type.image
    }

    // MARK: - Setups

    private func setupView() {
        add(subviews: imageView, nameLabel)
        imageView.contentMode = .scaleAspectFit
    }

    private func setupNameLabel() {

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        nameLabel.font = Constants.NameLabel.font
        nameLabel.textColor = .secondaryLabel
        nameLabel.textAlignment = .center
    }

    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor).isActive = true
    }
}

// MARK: - Constants

private extension PokemonDetailsTypeStackView {
    enum Constants {
        enum StackView {
            static let spacing: CGFloat = 4
        }

        enum NameLabel {
            static let top: CGFloat = 0
            static let font: UIFont = .systemFont(ofSize: 11, weight: .bold)
        }
    }
}
