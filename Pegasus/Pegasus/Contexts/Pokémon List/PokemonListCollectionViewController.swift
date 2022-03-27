//
//  PokemonListCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

final class PokemonListCollectionViewController: CollectionViewController {

    // MARK: - Properties

    weak var dataRepresentable: PokemonRegionRepresentable?

    private let dataSource: UICollectionViewDiffableDataSource<Region, Pokemon>

    // MARK: - Initialization

    override init() {
        let layout = PokemonListCollectionViewLayout()
        let collectionView = PokemonListCollectionView(frame: .zero, collectionViewLayout: layout)
        self.dataSource = UICollectionViewDiffableDataSource<Region, Pokemon>(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: layout)
        self.collectionView = collectionView
        setupController()
    }

    // MARK: - Functions

    func update(with regions: [Region]) {
        var snapshot = NSDiffableDataSourceSnapshot<Region, Pokemon>()
        snapshot.appendSections(regions)
        regions.enumerated().forEach {
            snapshot.appendItems($0.element.pokemon, toSection: regions[$0.offset])
        }
        dataSource.apply(snapshot)
    }

    // MARK: - Setups

    private func setupController() {
        self.collectionView.registerCellClass(PokemonListCell.self)

        let kind = PokemonListCollectionViewLayout.Constants.headerKind
        let headerRegistration = UICollectionView.SupplementaryRegistration<PokemonListHeader>(elementKind: kind) { header, _, indexPath in
            guard let region = self.dataRepresentable?.regions[indexPath.section] else { return }
            header.configure(with: region)
        }

        self.dataSource.supplementaryViewProvider = { (view, kind, index) in
            self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, Pokemon) -> UICollectionViewCell?) {
        { collectionView, indexPath, cellViewModel in
            let cell: PokemonListCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
}
