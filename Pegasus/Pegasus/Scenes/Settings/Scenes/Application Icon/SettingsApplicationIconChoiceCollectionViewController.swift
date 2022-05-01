//
//  SettingsApplicationIconChoiceCollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol SettingsApplicationIconChoiceCollectionViewControllerDelegate: AnyObject {
    func collectionViewController(_ collectionViewController: SettingsApplicationIconChoiceCollectionViewController, didSelectItemAt indexPath: IndexPath)
}

final class SettingsApplicationIconChoiceCollectionViewController: CollectionViewController {

    // MARK: - Typealiases

    private typealias CellRegistration = UICollectionView.CellRegistration<SettingsApplicationIconChoiceCell,
                                                                           SettingsApplicationIconChoiceCellViewModel>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SettingsApplicationIconChoiceGroupViewModel,
                                                              SettingsApplicationIconChoiceCellViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<SettingsApplicationIconChoiceGroupViewModel,
                                                                      SettingsApplicationIconChoiceCellViewModel>

    // MARK: - Properties

    weak var delegate: SettingsApplicationIconChoiceCollectionViewControllerDelegate?
    
    private let dataSource: DataSource

    // MARK: - Initialization

    override init() {
        let listLayout = CollectionViewCompositionalLayoutFactory.makeClean()
        let collectionView = SettingsApplicationIconChoiceCollectionView(frame: .zero, collectionViewLayout: listLayout)
        self.dataSource = DataSource(collectionView: collectionView, cellProvider: Self.cellProvider)
        super.init(collectionViewLayout: listLayout)
        self.collectionView = collectionView
    }

    // MARK: - Functions

    func setup(with sections: [SettingsApplicationIconChoiceGroupViewModel]) {
        guard !sections.isEmpty else { return }
        var dataSourceSnapshot = Snapshot()
        dataSourceSnapshot.appendSections(sections)
        sections.forEach { dataSourceSnapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(dataSourceSnapshot, animatingDifferences: false)
    }

    // MARK: - Cell Provider

    private static var cellProvider: ((UICollectionView, IndexPath, SettingsApplicationIconChoiceCellViewModel) -> UICollectionViewCell?) {
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

extension SettingsApplicationIconChoiceCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SettingsApplicationIconChoiceCell else { return }
        cell.animateSelection()
        delegate?.collectionViewController(self, didSelectItemAt: indexPath)
    }
}
