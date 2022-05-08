//
//  PokemonDetailsTypeContainerStackView.swift
//  Pegasus
//
//  Created by Tiago on 08/05/2022.
//

import UIKit

final class PokemonDetailsTypeContainerStackView: StackView {

    // MARK: - Subviews

    private let mainTypeStackView: PokemonDetailsTypeStackView = .init()
    private lazy var secondaryTypeStackView: PokemonDetailsTypeStackView = .init()

    // MARK: - Initialization

    init() {
        super.init(subviews: [mainTypeStackView])
        setupStackView()
    }

    // MARK: - Configuration

    func configure(with types: [PokemonTypeViewModel]) {
        guard types.hasOnlyOneElement else {
            configureForTwoTypes(with: types)
            return
        }

        guard let type = types.first else { return }
        mainTypeStackView.configure(with: type)
    }

    private func configureForTwoTypes(with types: [PokemonTypeViewModel]) {
        guard let firstType = types.first, let secondType = types[safe: Constants.secondTypeIndex] else { return }
        addArrangedSubview(secondaryTypeStackView)
        mainTypeStackView.configure(with: firstType)
        secondaryTypeStackView.configure(with: secondType)
    }

    // MARK: - Setups

    private func setupStackView() {
        spacing = Constants.spacing
    }
}

// MARK: - Constants

private extension PokemonDetailsTypeContainerStackView {
    enum Constants {
        static let spacing: CGFloat = 4
        static let secondTypeIndex: Int = 1
    }
}
