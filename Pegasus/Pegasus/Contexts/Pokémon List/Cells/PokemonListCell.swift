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

    // MARK: - Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }

    // MARK: - Functions

    func configure(with viewModel: PokemonListCellViewModel) {
        nameLabel.text = viewModel.name
    }

    // MARK: - Setups

    private func setupCell() {
        [nameLabel].forEach { contentView.addSubview($0) }
        setupStyle()
        setupNameLabel()
    }

    private func setupStyle() {
        round()
        backgroundColor = Color.cell
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
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
}

// MARK: - Constraints

private extension PokemonListCell {
    enum Constraints {
        enum NameLabel {
            static let side: CGFloat = 8
            static let bottom: CGFloat = 8
        }
    }
}
