//
//  PokemonListCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

protocol PokemonListCollectionViewControllerDelegate: AnyObject {
    func collectionViewController(_ collectionViewController: PokemonListCollectionViewController, didSelectItemAt indexPath: IndexPath)
}

final class PokemonListCollectionViewController: CollectionViewController {

    // MARK: - Typealiases

    private typealias Snapshot = NSDiffableDataSourceSnapshot<PokemonListHeaderViewModel, PokemonListCellViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<PokemonListHeaderViewModel, PokemonListCellViewModel>

    // MARK: - Properties

    weak var dataRepresentable: PokemonRegionRepresentable?
    weak var delegate: PokemonListCollectionViewControllerDelegate?

    private let dataSource: DataSource

    // MARK: - Initialization

    override init() {
        let layout = PokemonListCollectionViewLayout()
        let collectionView = PokemonListCollectionView(frame: .zero, collectionViewLayout: layout)
        self.dataSource = DataSource(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: layout)
        self.collectionView = collectionView
        setupController()
    }

    // MARK: - Functions

    func update(with regions: [PokemonListHeaderViewModel], and pokemon: [Int: [PokemonListCellViewModel]]) {
        var snapshot = Snapshot()
        snapshot.appendSections(regions)
        regions.enumerated().forEach {
            guard let pokemon = pokemon[$0.offset] else { return }
            snapshot.appendItems(pokemon, toSection: regions[$0.offset])
        }
        dataSource.apply(snapshot)
    }

    // MARK: - Setups

    private func setupController() {
        self.collectionView.registerCellClass(PokemonListCell.self)

        let kind = PokemonListCollectionViewLayout.ElementKinds.header
        let headerRegistration = UICollectionView.SupplementaryRegistration<PokemonListHeader>(elementKind: kind) { header, _, indexPath in
            guard let region = self.dataRepresentable?.regions[indexPath.section] else { return }
            header.configure(with: region)
        }

        self.dataSource.supplementaryViewProvider = { [unowned self] view, kind, index in
            self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, PokemonListCellViewModel) -> UICollectionViewCell?) {
        { collectionView, indexPath, cellViewModel in
            let cell: PokemonListCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
}

// MARK: - Collection View Delegate

extension PokemonListCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionViewController(self, didSelectItemAt: indexPath)
    }
}
