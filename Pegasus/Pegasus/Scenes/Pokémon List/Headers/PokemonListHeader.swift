//
//  PokemonListHeader.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import UIKit

final class PokemonListHeader: CollectionReusableView {

    // MARK: - Subviews

    private let nameLabel: UILabel = .init()

    // MARK: - Properties

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.attributedText = nil
    }

    // MARK: - Functions

    func configure(with region: PokemonListHeaderViewModel) {
        self.nameLabel.attributedText = region.title
    }

    // MARK: - Setups

    private func setup() {
        add(subviews: nameLabel)
        setupNameLabel()
    }

    private func setupNameLabel() {
        // Constraints
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.NameLabel.side).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constraints.NameLabel.side).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.NameLabel.bottom).isActive = true

        // Styling
        nameLabel.textAlignment = .center
    }
}

// MARK: - Constraints

private extension PokemonListHeader {
    enum Constraints {
        enum NameLabel {
            static let side: CGFloat = 8
            static let bottom: CGFloat = 8
        }
    }
}
