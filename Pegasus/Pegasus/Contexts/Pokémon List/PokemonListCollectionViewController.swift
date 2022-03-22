//
//  PokemonListCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

final class PokemonListCollectionViewController: CollectionViewController {

    // MARK: - Properties

    private let dataSource: UICollectionViewDiffableDataSource<Section, PokemonCellViewModel>

    // MARK: -

    private enum Section: CaseIterable {
        case main
    }

    // MARK: - Initialization

    override init() {
        let layout = PokemonListCollectionViewLayout()
        let collectionView = PokemonListCollectionView(frame: .zero, collectionViewLayout: layout)
        self.dataSource = UICollectionViewDiffableDataSource<Section, PokemonCellViewModel>(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: layout)
        self.collectionView = collectionView
        setupController()
    }

    // MARK: - Functions

    func update(with pokemon: [PokemonCellViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, PokemonCellViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(pokemon, toSection: .main)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot)
        }
    }

    // MARK: - Setups

    private func setupController() {
        self.collectionView.registerCellClass(PokemonListCell.self)
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, PokemonCellViewModel) -> UICollectionViewCell?) {
        { collectionView, indexPath, cellViewModel in
            print("\(indexPath) \(cellViewModel)")

            let cell: PokemonListCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
}
