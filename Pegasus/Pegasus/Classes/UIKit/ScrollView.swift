//
//  ScrollView.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import UIKit

open class ScrollView: UIScrollView {

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        alwaysBounceVertical = true
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
