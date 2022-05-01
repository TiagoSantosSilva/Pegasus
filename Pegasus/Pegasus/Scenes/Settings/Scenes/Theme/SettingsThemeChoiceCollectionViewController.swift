//
//  SettingsThemeChoiceCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol SettingsThemeChoiceCollectionViewControllerDelegate: AnyObject {
    func collectionViewController(_ collectionViewController: SettingsThemeChoiceCollectionViewController, didSelectItemAt indexPath: IndexPath)
}

final class SettingsThemeChoiceCollectionViewController: CollectionViewController, SnapshotReloadable {

    // MARK: - Typealiases

    typealias SectionIdentifierType = SettingsThemeChoiceGroupViewModel
    typealias ItemIdentifierType = SettingsThemeChoiceCellViewModel
    typealias DataSource = UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>

    private typealias CellRegistration = UICollectionView.CellRegistration<SettingsThemeChoiceCell, ItemIdentifierType>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>

    // MARK: - Properties

    weak var delegate: SettingsThemeChoiceCollectionViewControllerDelegate?

    let dataSource: DataSource

    // MARK: - Initialization

    override init() {
        let listLayout = CollectionViewCompositionalLayoutFactory.makeClean()
        let collectionView = SettingsThemeChoiceCollectionView(frame: .zero, collectionViewLayout: listLayout)
        self.dataSource = DataSource(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: listLayout)
        self.collectionView = collectionView
        self.collectionView.backgroundColor = .systemIndigo
    }

    // MARK: - Functions

    func setup(with section: SettingsThemeChoiceGroupViewModel) {
        var snapshot = Snapshot()
        snapshot.appendSections([section])
        snapshot.appendItems(section.items)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, SettingsThemeChoiceCellViewModel) -> UICollectionViewCell?) {
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

extension SettingsThemeChoiceCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SettingsThemeChoiceCell else { return }
        cell.animateSelection()
        delegate?.collectionViewController(self, didSelectItemAt: indexPath)
    }
}
