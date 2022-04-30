//
//  SettingsCollectionViewLayout.swift
//  Pegasus
//
//  Created by Tiago on 30/04/2022.
//

import UIKit

final class SettingsCollectionViewLayout: CollectionViewCompositionalLayout {

    // MARK: - Initialization

    init() {
        super.init(section: Self.section())
    }

    // MARK: - Functions

    static func section() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: Layout.Item.width,
                                              heightDimension: Layout.Item.height)

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

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

extension SettingsCollectionViewLayout {
    enum ElementKinds {
        static let header: String = "settings-header-kind"
    }
}

// MARK: - Constants

private extension SettingsCollectionViewLayout {
    enum Layout {
        enum Item {
            static let width: NSCollectionLayoutDimension = .fractionalWidth(1.0)
            static let height: NSCollectionLayoutDimension = .absolute(44)
        }

        enum Header {
            static let width: NSCollectionLayoutDimension = .fractionalWidth(1.0)
            static let height: NSCollectionLayoutDimension = .estimated(44)
        }

        enum Group {
            static let width: NSCollectionLayoutDimension = .fractionalWidth(1.0)
            static let height: NSCollectionLayoutDimension = .fractionalHeight(1/6)
        }

        enum Section {
            static let contentInset: CGFloat = 8
        }
    }
}
