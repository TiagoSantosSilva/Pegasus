//
//  RefinementViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

protocol RefinementViewModelable: AnyObject {
    var sections: [RefinementHeaderViewModel] { get }

    func modeledChoices() -> RefinementChoices
    func toggle(at indexPath: IndexPath, itemsReconfiguredHandler: ([RefinementItemCellViewModel]) -> Void)
}

struct RefinementChoices {
    let order: RefinementOrder
    let availability: RefinementAvailability
    let variant: RefinementVariant
    let regions: [RefinementRegion]
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

    func modeledChoices() -> RefinementChoices {
        let order = sections.first { $0.type == .order }!
        let item = order.items.firstIndex { $0.isSelected }!
        let orderChoice = RefinementOrder.allCases[item]

        dump(orderChoice)

        return RefinementChoices(order: orderChoice,
                                 availability: .all,
                                 variant: .shiny,
                                 regions: [])
    }
}
