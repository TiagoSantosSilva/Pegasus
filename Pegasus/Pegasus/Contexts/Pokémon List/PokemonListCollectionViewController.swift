//
//  PokemonListCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

final class PokemonListCell: UICollectionViewCell {

    // MARK: - Subviews

    private let nameLabel: UILabel = .init()

    // MARK: - Functions

    func configure(with viewModel: PokemonCellViewModel) {
        backgroundColor = .orange
        nameLabel.text = viewModel.name
    }
}

final class PokemonListCollectionViewController: CollectionViewController {

    // MARK: - Properties

    private var dataSource: UICollectionViewDiffableDataSource<Section, PokemonCellViewModel>!

    // MARK: -

    private enum Section: CaseIterable {
        case main
    }

    // MARK: - Initialization

    override init() {
        super.init()
        setupController()
    }

    // MARK: - Functions

    func update(with pokemon: [PokemonCellViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, PokemonCellViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(pokemon, toSection: .main)
        dataSource.apply(snapshot)
    }

    private func setupController() {
        self.collectionView.registerCellClass(PokemonListCell.self)

        self.dataSource = UICollectionViewDiffableDataSource<Section, PokemonCellViewModel>(collectionView: collectionView) { collectionView, indexPath, cellViewModel in
            print("\(indexPath) \(cellViewModel)")

            let cell: PokemonListCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
}
