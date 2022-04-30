//
//  SettingsCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import UIKit

protocol SettingsCollectionViewControllerDelegate: AnyObject {
    func collectionViewController(_ collectionViewController: SettingsCollectionViewController, didSelectItemAt indexPath: IndexPath)
}

final class SettingsCollectionViewController: CollectionViewController {

    // MARK: - Typealiases

    private typealias CellRegistration = UICollectionView.CellRegistration<SettingsCell, SettingsItemCellViewModel>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SettingsItemGroupViewModel, SettingsItemCellViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<SettingsItemGroupViewModel, SettingsItemCellViewModel>

    // MARK: - Properties

    weak var delegate: SettingsCollectionViewControllerDelegate?

    private let dataSource: DataSource

    // MARK: - Initialization

    override init() {
        let listLayout = CollectionViewCompositionalLayoutFactory.makeHeader()
        let collectionView = SettingsCollectionView(frame: .zero, collectionViewLayout: listLayout)
        self.dataSource = DataSource(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: listLayout)
        self.collectionView = collectionView
        setupController()
    }

    // MARK: - Functions

    func setup(with sections: [SettingsItemGroupViewModel]) {
        guard !sections.isEmpty else { return }
        var dataSourceSnapshot = Snapshot()
        dataSourceSnapshot.appendSections(sections)
        sections.forEach { dataSourceSnapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(dataSourceSnapshot, animatingDifferences: false)
    }

    private func setupController() {
        self.collectionView.registerCellClass(RefinementListCell.self)

        let headerRegistration = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) { [unowned self] header, _, indexPath in
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section].header

            var configuration = header.defaultContentConfiguration()
            configuration.text = section.name
            header.contentConfiguration = configuration
        }

        self.dataSource.supplementaryViewProvider = { [unowned self] _, kind, index in
            self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, SettingsItemCellViewModel) -> UICollectionViewCell?) {
        let cellRegistration = CellRegistration { cell, _, cellViewModel in
            cell.configure(with: cellViewModel)
        }

        return { collectionView, indexPath, cellViewModel in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                         for: indexPath,
                                                         item: cellViewModel)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension SettingsCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SettingsCell else { return }
        cell.animateSelection()
        delegate?.collectionViewController(self, didSelectItemAt: indexPath)
    }
}
