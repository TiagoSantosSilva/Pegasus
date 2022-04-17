//
//  PokemonListCollectionViewLayoutProxy.swift
//  Pegasus
//
//  Created by Tiago on 21/03/2022.
//

import UIKit

protocol PokemonListCollectionViewLayoutProxyDelegate: AnyObject {
    func layout(_ layout: PokemonListCollectionViewLayoutProxy, shouldHaveHeaderAt section: Int) -> Bool
}

final class PokemonListCollectionViewLayoutProxy {

    // MARK: - Properties

    weak var delegate: PokemonListCollectionViewLayoutProxyDelegate?

    lazy var layout: UICollectionViewCompositionalLayout = {
        UICollectionViewCompositionalLayout { section, _ in
            return self.layoutSection(at: section)
        }
    }()

    // MARK: - Functions

    private func layoutSection(at section: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: Layout.Item.width,
                                              heightDimension: Layout.Item.height)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(withEqualValue: Layout.Item.contentInset)

        let groupSize = NSCollectionLayoutSize(widthDimension: Layout.Group.width,
                                               heightDimension: Layout.Group.height)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(withEqualValue: Layout.Section.contentInset)
        layoutSection.boundarySupplementaryItems = boundarySupplementaryItems(at: section)
        return layoutSection
    }

    private func boundarySupplementaryItems(at section: Int) -> [NSCollectionLayoutBoundarySupplementaryItem] {
        guard let shouldHaveHeader = delegate?.layout(self, shouldHaveHeaderAt: section), shouldHaveHeader else { return [] }
        let header = NSCollectionLayoutSize(widthDimension: Layout.Header.width,
                                            heightDimension: Layout.Header.height)
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: header,
                                                                        elementKind: ElementKinds.header,
                                                                        alignment: .top)
        return [sectionHeader]
    }
}

// MARK: - Element Kinds

extension PokemonListCollectionViewLayoutProxy {
    enum ElementKinds {
        static let header: String = "pokemon-list-header-kind"
    }
}

// MARK: - Constants

private extension PokemonListCollectionViewLayoutProxy {
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
