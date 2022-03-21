//
//  Theme.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

struct Theme {

    // MARK: - Properties

    let collectionView: CollectionViewTheme
}

extension Theme {
    static let dark: Theme = {
        return Theme(collectionView: .dark)
    }()
}

enum CollectionViewTheme {
    case dark
    case light
}

extension CollectionViewTheme {
    var backgroundColor: UIColor {
        switch self {
        case .dark: return Color.darkGray
        case .light: return .white
        }
    }
}
