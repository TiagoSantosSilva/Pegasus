//
//  Color.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

enum Color {
    static var cell: UIColor {
        .systemGray5
    }

    static var background: UIColor {
        .systemGray6
    }

    static var tint: UIColor {
        .systemRed
    }
}

// MARK: - Neutral Tones

extension Color {
    enum NeutralTones {
        enum Light {
            static let blue: UIColor = .init(red: 213, green: 222, blue: 231)
            static let green: UIColor = .init(red: 221, green: 232, blue: 222)
            static let purple: UIColor = .init(red: 228, green: 223, blue: 241)
        }

        enum Regular {
            static let blue: UIColor = .init(red: 10, green: 96, blue: 255)
            static let green: UIColor = .init(red: 68, green: 213, blue: 82)
            static let purple: UIColor = .init(red: 83, green: 38, blue: 165)
        }

        enum Dark {
            static let blue: UIColor = .init(red: 39, green: 51, blue: 65)
            static let green: UIColor = .init(red: 31, green: 50, blue: 33)
            static let purple: UIColor = .init(red: 45, green: 38, blue: 61)
        }
    }
}

// MARK: - Tab Bar

extension Color {
    enum TabBar {
        static var barTint: UIColor {
            Color.cell
        }

        static var tint: UIColor {
            Color.tint
        }

        static var unselectedItemTint: UIColor {
            UIColor.secondaryLabel
        }

        static var background: UIColor {
            Color.cell
        }
    }
}

// MARK: - Navigation Bar

extension Color {
    enum NavigationBar {
        static var tint: UIColor {
            Color.tint
        }
    }
}
