//
//  NavigationBar.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

final class NavigationBar: UINavigationBar {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Setups

    private func setup() {
        self.prefersLargeTitles = true

        let appearance = NavigationBarAppearance()
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
    }
}
