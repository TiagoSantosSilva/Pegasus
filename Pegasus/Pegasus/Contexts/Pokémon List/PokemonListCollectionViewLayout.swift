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
        let itemSize = NSCollectionLayoutSize(widthDimension: Layout.Item.width,
                                              heightDimension: Layout.Item.height)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(withEqualValue: Layout.Item.contentInset)

        let groupSize = NSCollectionLayoutSize(widthDimension: Layout.Group.width,
                                               heightDimension: Layout.Group.height)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let header = NSCollectionLayoutSize(widthDimension: Layout.Header.width,
                                            heightDimension: Layout.Header.height)
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: header,
                                                                        elementKind: ElementKinds.header,
                                                                        alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(withEqualValue: Layout.Section.contentInset)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
}

// MARK: - Element Kinds

extension PokemonListCollectionViewLayout {
    enum ElementKinds {
        static let header: String = "pokemon-list-header-kind"
    }
}

// MARK: - Constants

private extension PokemonListCollectionViewLayout {
    enum Layout {
        enum Item {
            static let width: NSCollectionLayoutDimension = .fractionalWidth(1/3)
            static let height: NSCollectionLayoutDimension = .fractionalHeight(1.0)
            static let contentInset: CGFloat = 4
        }

        enum Group {
            static let width: NSCollectionLayoutDimension = .fractionalWidth(1.0)
            static let height: NSCollectionLayoutDimension = .fractionalHeight(1/6)
        }

        enum Header {
            static let width: NSCollectionLayoutDimension = .fractionalWidth(1.0)
            static let height: NSCollectionLayoutDimension = .estimated(44)
        }

        enum Section {
            static let contentInset: CGFloat = 8
        }
    }
}
