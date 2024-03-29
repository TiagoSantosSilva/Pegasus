//
//  PokemonListCell.swift
//  Pegasus
//
//  Created by Tiago on 21/03/2022.
//

import UIKit

final class PokemonListCell: CollectionViewCell {

    // MARK: - Subviews

    private let nameLabel: UILabel = .init()
    private let imageView: UIImageView = .init()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        imageView.image = nil
    }

    // MARK: - Functions

    func configure(with viewModel: PokemonListCellViewModel) {
        nameLabel.text = viewModel.name
        imageView.image = viewModel.image
    }

    // MARK: - Setups

    private func setup() {
        contentView.add(subviews: nameLabel, imageView)
        setupStyle()
        setupNameLabel()
        setupImageView()
    }

    private func setupStyle() {
        round()
    }

    private func setupNameLabel() {
        // Constraints
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.NameLabel.side).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constraints.NameLabel.side).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.NameLabel.bottom).isActive = true

        // Style

        nameLabel.textColor = UIColor.label
        nameLabel.textAlignment = .center
        nameLabel.font = .nameLabel
    }

    private func setupImageView() {
        // Constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constraints.ImageView.top).isActive = true
        imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -Constraints.ImageView.bottom).isActive = true
        imageView.contentMode = .scaleAspectFit
    }
}

// MARK: - Constraints

private extension PokemonListCell {
    enum Constraints {
        enum NameLabel {
            static let side: CGFloat = 8
            static let bottom: CGFloat = 8
        }

        enum ImageView {
            static let top: CGFloat = 16
            static let bottom: CGFloat = 8
        }
    }
}
