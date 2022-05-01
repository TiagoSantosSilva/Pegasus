//
//  SettingsViewModel.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import Foundation

protocol SettingsViewModelable: AnyObject {
    var groups: [SettingsItemGroupViewModel] { get }

    func reloadGroups()
}

final class SettingsViewModel: SettingsViewModelable {

    // MARK: - Properties

    private(set) var groups: [SettingsItemGroupViewModel]

    // MARK: - Initialization

    init() {
        self.groups = SettingsItemGroupViewModelFactory.makeGroups()
    }

    // MARK: - Functions

    func reloadGroups() {
        self.groups = SettingsItemGroupViewModelFactory.makeGroups()
    }
}
