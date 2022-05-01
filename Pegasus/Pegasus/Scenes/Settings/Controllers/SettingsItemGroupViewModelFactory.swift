//
//  SettingsItemGroupViewModelFactory.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

enum SettingsItemGroupViewModelFactory {
    static func makeGroups() -> [SettingsItemGroupViewModel] {
        SettingsSection.allCases.map {
            SettingsItemGroupViewModel(header: SettingsItemHeaderViewModel(name: $0.name), items: $0.items)
        }
    }
}
