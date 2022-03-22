//
//  PokemonListCell.swift
//  Pegasus
//
//  Created by Tiago on 21/03/2022.
//

import UIKit

final class PokemonListCell: UICollectionViewCell {

    // MARK: - Subviews

    private let nameLabel: UILabel = .init()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    func configure(with viewModel: PokemonCellViewModel) {
        nameLabel.text = viewModel.name
    }

    // MARK: - Setups

    private func setupCell() {
        [nameLabel].forEach { self.contentView.addSubview($0) }

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.NameLabel.side).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constraints.NameLabel.side).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.NameLabel.bottom).isActive = true

        nameLabel.textColor = .white
        nameLabel.textAlignment = .center

        self.backgroundColor = Color.lightGray
    }
}

// MARK: - Constants

private extension PokemonListCell {
    enum Constraints {
        enum NameLabel {
            static let side: CGFloat = 8
            static let bottom: CGFloat = 8
        }
    }
}
