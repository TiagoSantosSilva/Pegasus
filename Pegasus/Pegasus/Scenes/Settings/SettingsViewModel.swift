//
//  SettingsViewModel.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import Foundation

protocol SettingsViewModelable: AnyObject {
    var groups: [SettingsItemGroupViewModel] { get }
}

final class SettingsViewModel: SettingsViewModelable {

    // MARK: - Properties

    private(set) var groups: [SettingsItemGroupViewModel]

    // MARK: - Initialization

    init() {
        self.groups = SettingsSection.allCases.map {
            SettingsItemGroupViewModel(header: SettingsItemHeaderViewModel(name: $0.name), items: $0.items)
        }
    }
}
