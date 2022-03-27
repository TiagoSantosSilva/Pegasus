//
//  PokemonListHeader.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import UIKit

open class CollectionReusableView: UICollectionReusableView {

    // MARK: - Initialization

    public override init(frame: CGRect) {
        super.init(frame: frame)
        stylize()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    private func stylize() {
        backgroundColor = Color.background
    }
}

final class PokemonListHeader: CollectionReusableView {

    // MARK: - Properties

    private let nameLabel: UILabel

    // MARK: - Properties

    override init(frame: CGRect) {
        self.nameLabel = UILabel()
        super.init(frame: frame)
        setup()
    }

    // MARK: - Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }

    // MARK: - Functions

    func configure(with region: Region) {
        self.nameLabel.text = region.name
    }

    // MARK: - Setups

    private func setup() {
        addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.NameLabel.side).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constraints.NameLabel.side).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.NameLabel.bottom).isActive = true

        nameLabel.textColor = UIColor.label
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
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
