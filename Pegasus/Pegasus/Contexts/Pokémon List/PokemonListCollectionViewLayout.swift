//
//  PokemonListCollectionViewLayout.swift
//  Pegasus
//
//  Created by Tiago on 21/03/2022.
//

import UIKit

final class PokemonListCollectionViewLayout: UICollectionViewCompositionalLayout {

    // MARK: - Initialization

    init() {
        super.init(section: Self.section())
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    private static func section() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                                        elementKind: Constants.headerKind,
                                                                        alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
}

extension PokemonListCollectionViewLayout {
    enum Constants {
        static let headerKind: String = "pokemon-list-header-kind"
    }
}
