//
//  CollectionViewCompositionalLayoutFactory.swift
//  Pegasus
//
//  Created by Tiago on 11/04/2022.
//

import UIKit

enum CollectionViewCompositionalLayoutFactory {
    static func makeHeader(appearance: UICollectionLayoutListConfiguration.Appearance = .insetGrouped,
                           headerMode: UICollectionLayoutListConfiguration.HeaderMode = .supplementary,
                           backgroundColor: UIColor = Constants.backgroundColor) -> UICollectionViewCompositionalLayout {
        var layout = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layout.headerMode = headerMode
        layout.footerMode = .none
        layout.backgroundColor = backgroundColor
        return .list(using: layout)
    }

    static func makeClean(appearance: UICollectionLayoutListConfiguration.Appearance = .insetGrouped,
                          backgroundColor: UIColor = Constants.backgroundColor) -> UICollectionViewCompositionalLayout {
        var layout = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layout.headerMode = .none
        layout.footerMode = .none
        layout.backgroundColor = backgroundColor
        return .list(using: layout)
    }
}

// MARK: - Constants

private extension CollectionViewCompositionalLayoutFactory {
    enum Constants {
        static let backgroundColor: UIColor = Color.background
    }
}
