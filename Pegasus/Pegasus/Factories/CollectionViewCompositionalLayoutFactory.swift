//
//  CollectionViewCompositionalLayoutFactory.swift
//  Pegasus
//
//  Created by Tiago on 11/04/2022.
//

import UIKit

enum CollectionViewCompositionalLayoutFactory {
    static func makeHeader(appearance: UICollectionLayoutListConfiguration.Appearance = .insetGrouped,
                           headerMode: UICollectionLayoutListConfiguration.HeaderMode = .supplementary) -> UICollectionViewCompositionalLayout {
        var layout = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layout.headerMode = .supplementary
        layout.footerMode = .none
        layout.backgroundColor = Color.background
        return .list(using: layout)
    }
}
