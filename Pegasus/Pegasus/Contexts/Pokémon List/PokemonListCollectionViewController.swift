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

    private typealias Snapshot = NSDiffableDataSourceSnapshot<PokemonListGroupViewModel, PokemonListCellViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<PokemonListGroupViewModel, PokemonListCellViewModel>

    // MARK: - Properties

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

    @MainActor func update(with groups: [PokemonListGroupViewModel]) {
        Task {
            var snapshot = Snapshot()
            snapshot.appendSections(groups)
            groups.enumerated().forEach {
                snapshot.appendItems($0.element.pokemon, toSection: $0.element)
            }
            collectionView.layer.add(CATransition.fade, forKey: nil)
            await dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    // MARK: - Setups

    private func setupController() {
        self.collectionView.registerCellClass(PokemonListCell.self)

        let kind = PokemonListCollectionViewLayout.ElementKinds.header
        let headerRegistration = UICollectionView.SupplementaryRegistration<PokemonListHeader>(elementKind: kind) { [unowned self] header, _, indexPath in
            let region = self.dataSource.snapshot().sectionIdentifiers[indexPath.section].region
            header.configure(with: region)
        }

        self.dataSource.supplementaryViewProvider = { [unowned self] _, _, index in
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
