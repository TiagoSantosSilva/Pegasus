//
//  PokemonListHeaderViewModelAttributer.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

enum PokemonListHaderViewModelAttributer {

    // MARK: - Internal Properties

    static let nameAttributes: [NSAttributedString.Key: Any] = [
        .font: Constants.font,
        .foregroundColor: UIColor.label
    ]

    static let countAttributes: [NSAttributedString.Key: Any] = [
        .font: Constants.font,
        .foregroundColor: UIColor.secondaryLabel
    ]

    // MARK: - Constants

    private enum Constants {
        static let font: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
}
