//
//  RefinementHeader.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import UIKit

final class RefinementHeader: CollectionReusableView {

    // MARK: - Subviews

    private let nameLabel: UILabel = .init()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }

    // MARK: - Functions

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
        nameLabel.textAlignment = .left
        nameLabel.textColor = .secondaryLabel
        nameLabel.font = .nameLabel
    }
}

// MARK: - Constraints

private extension RefinementHeader {
    enum Constraints {
        enum NameLabel {
            static let side: CGFloat = 8
            static let bottom: CGFloat = 8
        }
    }
}
