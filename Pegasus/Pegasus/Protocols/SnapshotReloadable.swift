//
//  SnapshotReloadable.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol SnapshotReloadable {
    associatedtype SectionIdentifierType: Hashable
    associatedtype ItemIdentifierType: Hashable
    associatedtype DataSource: UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>

    var dataSource: DataSource { get }

    func reload()
}

extension SnapshotReloadable {
    func reload() {
        var snapshot = dataSource.snapshot()
        snapshot.reloadItems(snapshot.itemIdentifiers)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
