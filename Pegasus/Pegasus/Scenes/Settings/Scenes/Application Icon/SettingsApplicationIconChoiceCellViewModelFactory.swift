//
//  SettingsApplicationIconChoiceCellViewModelFactory.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

enum SettingsApplicationIconChoiceCellViewModelFactory {

    // MARK: - Functions

    static func makeIcons() -> [SettingsApplicationIconChoiceCellViewModel] {
        SettingsApplicationIcon.allCases.map { .init(name: $0.name, image: $0.image) }
    }
}
