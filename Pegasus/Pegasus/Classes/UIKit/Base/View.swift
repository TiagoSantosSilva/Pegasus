//
//  View.swift
//  Pegasus
//
//  Created by Tiago on 09/05/2022.
//

import UIKit

open class View: UIView {

    // MARK: - Initialization

    public init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
