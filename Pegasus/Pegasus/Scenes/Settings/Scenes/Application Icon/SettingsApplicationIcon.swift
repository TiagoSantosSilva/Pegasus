//
//  SettingsApplicationIcon.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

enum SettingsApplicationIcon: Int, CaseIterable {
    case red
    case blue
    case white
    case black
    case yellow
    case green
    case purple
    case indigo
    case orange
    case pink
    case brown
}

extension SettingsApplicationIcon {
    var name: String {
        switch self {
        case .red:
            return "Red"
        case .blue:
            return "Blue"
        case .white:
            return "White"
        case .black:
            return "Black"
        case .yellow:
            return "Yellow"
        case .green:
            return "Green"
        case .purple:
            return "Purple"
        case .indigo:
            return "Indigo"
        case .orange:
            return "Orange"
        case .pink:
            return "Pink"
        case .brown:
            return "Brown"
        }
    }

    var image: UIImage {
        switch self {
        case .red:
            return .make(color: .systemRed)
        case .blue:
            return .make(color: .systemBlue)
        case .white:
            return .make(color: .white)
        case .black:
            return .make(color: .black)
        case .yellow:
            return .make(color: .systemYellow)
        case .green:
            return .make(color: .systemGreen)
        case .purple:
            return .make(color: .systemPurple)
        case .indigo:
            return .make(color: .systemIndigo)
        case .orange:
            return .make(color: .systemOrange)
        case .pink:
            return .make(color: .systemPink)
        case .brown:
            return .make(color: .systemBrown)
        }
    }
}
