//
//  SettingsTheme.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

enum SettingsTheme: Int, CaseIterable, Equatable, Codable {
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

extension SettingsTheme {
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

    var color: UIColor {
        switch self {
        case .red:
            return .systemRed
        case .blue:
            return .systemBlue
        case .white:
            return .white
        case .black:
            return .black
        case .yellow:
            return .systemYellow
        case .green:
            return .systemGreen
        case .purple:
            return .systemPurple
        case .indigo:
            return .systemIndigo
        case .orange:
            return .systemOrange
        case .pink:
            return .systemPink
        case .brown:
            return .systemBrown
        }
    }

    var image: UIImage {
        makeImage(color: color)
    }

    private func makeImage(color: UIColor) -> UIImage {
        .make(color: color, size: Constants.imageSize)
    }
}

// MARK: - Constants

private enum Constants {
    static let imageSize: CGSize = .init(width: 24, height: 24)
}
