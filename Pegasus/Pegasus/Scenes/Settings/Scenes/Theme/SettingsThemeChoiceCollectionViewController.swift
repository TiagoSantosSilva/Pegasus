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

final class SettingsThemeChoiceCollectionViewController: CollectionViewController {

    // MARK: - Typealiases

    private typealias CellRegistration = UICollectionView.CellRegistration<SettingsThemeChoiceCell,
                                                                           SettingsThemeChoiceCellViewModel>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SettingsThemeChoiceGroupViewModel,
                                                              SettingsThemeChoiceCellViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<SettingsThemeChoiceGroupViewModel,
                                                                      SettingsThemeChoiceCellViewModel>

    // MARK: - Properties

    weak var delegate: SettingsThemeChoiceCollectionViewControllerDelegate?

    private let dataSource: DataSource

    // MARK: - Initialization

    override init() {
        let listLayout = CollectionViewCompositionalLayoutFactory.makeHeader()
        let collectionView = SettingsThemeChoiceCollectionView(frame: .zero, collectionViewLayout: listLayout)
        self.dataSource = DataSource(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: listLayout)
        self.collectionView = collectionView
        self.collectionView.backgroundColor = .systemIndigo
    }

    // MARK: - Functions

    func setup(with sections: [SettingsThemeChoiceGroupViewModel]) {
        guard !sections.isEmpty else { return }
        var dataSourceSnapshot = Snapshot()
        dataSourceSnapshot.appendSections(sections)
        sections.forEach { dataSourceSnapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(dataSourceSnapshot, animatingDifferences: false)
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
