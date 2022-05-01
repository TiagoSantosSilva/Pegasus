//
//  SettingsApplicationIconChoiceViewModel.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

protocol SettingsApplicationIconChoiceViewModelable {

    var groups: [SettingsApplicationIconChoiceGroupViewModel] { get }
}

struct SettingsApplicationIconChoiceViewModel: SettingsApplicationIconChoiceViewModelable {

    // MARK: - Properties

    let groups: [SettingsApplicationIconChoiceGroupViewModel]

    // MARK: - Initialization

    init() {
        self.groups = [.init(items: SettingsApplicationIconChoiceCellViewModelFactory.makeIcons())]
    }
}
