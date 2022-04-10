//
//  RefinementViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

protocol RefinementViewModelable: AnyObject {
    var sections: [RefinementHeaderViewModel] { get }

    func toggle(at indexPath: IndexPath, itemsReconfiguredHandler: ([RefinementItemCellViewModel]) -> Void)
}

final class RefinementViewModel: RefinementViewModelable {

    // MARK: - Properties

    let sections: [RefinementHeaderViewModel] = RefinementSection.headers

    // MARK: - Initialization

    init(dependencies: DependencyContainable) {

    }

    // MARK: - Functions

    func toggle(at indexPath: IndexPath, itemsReconfiguredHandler: ([RefinementItemCellViewModel]) -> Void) {
        let section = sections[indexPath.section]
        let item = section.items[indexPath.row]

        if !section.isMultipleSelectable, item.isSelected {
            return itemsReconfiguredHandler([])
        }

        item.isSelected.toggle()

        guard !section.isMultipleSelectable else { return itemsReconfiguredHandler([item]) }
        section.items.filter { $0.uuid != item.uuid }.forEach { $0.isSelected = false }
        itemsReconfiguredHandler(section.items)
    }
}
