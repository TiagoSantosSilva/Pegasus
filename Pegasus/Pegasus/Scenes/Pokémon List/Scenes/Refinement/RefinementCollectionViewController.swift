//
//  RefinementCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import UIKit

protocol RefinementCollectionViewControllerDelegate: AnyObject {
    func collectionViewController(_ collectionViewController: RefinementCollectionViewController, didSelectItemAt indexPath: IndexPath)
}

final class RefinementCollectionViewController: CollectionViewController {

    // MARK: - Typealiases

    private typealias Snapshot = NSDiffableDataSourceSnapshot<RefinementHeaderViewModel, RefinementItemCellViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<RefinementHeaderViewModel, RefinementItemCellViewModel>

    // MARK: - Properties

    weak var delegate: RefinementCollectionViewControllerDelegate?

    private let dataSource: DataSource

    // MARK: - Initialization

    override init() {
        let listLayout = CollectionViewCompositionalLayoutFactory.makeHeader()
        let collectionView = RefinementCollectionView(frame: .zero, collectionViewLayout: listLayout)
        self.dataSource = DataSource(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: listLayout)
        self.collectionView = collectionView
        setupController()
    }

    // MARK: - Functions

    func setup(with sections: [RefinementHeaderViewModel]) {
        guard !sections.isEmpty else { return }
        var dataSourceSnapshot = Snapshot()
        dataSourceSnapshot.appendSections(sections)
        sections.forEach { dataSourceSnapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(dataSourceSnapshot, animatingDifferences: false)
    }

    func update(items: [RefinementItemCellViewModel]) {
        var snapshot = dataSource.snapshot()
        snapshot.reconfigureItems(items)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    // MARK: - Setups

    private func setupController() {
        self.collectionView.registerCellClass(RefinementListCell.self)

        let headerRegistration = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) { [unowned self] header, _, indexPath in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]

            var configuration = header.defaultContentConfiguration()
            configuration.text = section.name
            header.contentConfiguration = configuration
        }

        self.dataSource.supplementaryViewProvider = { [unowned self] _, kind, index in
            self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, RefinementItemCellViewModel) -> UICollectionViewCell?) {
        { collectionView, indexPath, cellViewModel in
            let cell: RefinementListCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension RefinementCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.collectionViewController(self, didSelectItemAt: indexPath)
    }
}
