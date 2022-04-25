//
//  RefinementViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import Foundation

protocol RefinementViewModelable: AnyObject {
    var sections: [RefinementHeaderViewModel] { get }

    func resetChoices(completion: ([RefinementHeaderViewModel]) -> Void)
    func modeledChoices() -> RefinementChoices
    func toggle(at indexPath: IndexPath, itemsReconfiguredHandler: ([RefinementItemCellViewModel]) -> Void)
}

struct RefinementChoices: Equatable {
    let order: RefinementOrder
    let availability: RefinementAvailability
    let variant: RefinementVariant
    let regions: [RefinementRegion]
}

final class RefinementViewModel: RefinementViewModelable {

    // MARK: - Properties

    private(set) var sections: [RefinementHeaderViewModel]

    private let defaultChoices: RefinementChoices

    // MARK: - Initialization

    init(dependencies: DependencyContainable, choices: RefinementChoices, defaultChoices: RefinementChoices) {
        self.sections = Self.sections(for: choices)
        self.defaultChoices = defaultChoices
    }

    // MARK: - Functions

    func resetChoices(completion: ([RefinementHeaderViewModel]) -> Void) {
        sections = Self.sections(for: defaultChoices)
        completion(sections)
    }

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
        let chosenOrderIndex = selectedIndex(of: .order, in: sections)
        let chosenOrder = RefinementOrder.allCases[chosenOrderIndex]

        let regionSection = sections.first { $0.type == .region }!
        let chosenRegions = regionSection.items.filter { $0.isSelected }
        let regionChoices = chosenRegions.compactMap { RefinementRegion(rawValue: $0.name.lowercased()) }

        let chosenVariantIndex = selectedIndex(of: .variant, in: sections)
        let chosenVariant = RefinementVariant.allCases[chosenVariantIndex]

        let chosenAvailabilityIndex = selectedIndex(of: .availability, in: sections)
        let chosenAvailability = RefinementAvailability.allCases[chosenAvailabilityIndex]

        return RefinementChoices(order: chosenOrder,
                                 availability: chosenAvailability,
                                 variant: chosenVariant,
                                 regions: regionChoices)
    }

    private func selectedIndex(of type: RefinementSection, in sections: [RefinementHeaderViewModel]) -> Int {
        return sections.first { $0.type == type }!.items.firstIndex { $0.isSelected }!
    }

    // MARK: - Private Static Functions

    private static func sections(for choices: RefinementChoices) -> [RefinementHeaderViewModel] {
        RefinementSection.allCases.map {
            let items = Self.items(for: $0, with: choices)
            return RefinementHeaderViewModel(name: $0.rawValue.firstLetterCapitalized, type: $0, isMultipleSelectable: $0.isMultipleSelectable, items: items)
        }
    }

    private static func items(for section: RefinementSection, with choices: RefinementChoices) -> [RefinementItemCellViewModel] {
        switch section {
        case .variant:
            return RefinementVariant.allCases.map {
                let isSelected = choices.variant == $0
                return RefinementItemCellViewModel(name: $0.name, type: RefinementVariant.self, isSelected: isSelected)
            }
        case .availability:
            return RefinementAvailability.allCases.map {
                let isSelected = choices.availability == $0
                return RefinementItemCellViewModel(name: $0.name, type: RefinementAvailability.self, isSelected: isSelected)
            }
        case .order:
            return RefinementOrder.allCases.map {
                let isSelected = choices.order == $0
                return RefinementItemCellViewModel(name: $0.name, type: RefinementOrder.self, isSelected: isSelected)
            }
        case .region:
            return RefinementRegion.allCases.map {
                let isSelected = choices.regions.contains($0)
                return RefinementItemCellViewModel(name: $0.name, type: RefinementRegion.self, isSelected: isSelected)
            }
        }
    }
}
