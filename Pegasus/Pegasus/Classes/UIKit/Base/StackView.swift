//
//  StackView.swift
//  Pegasus
//
//  Created by Tiago on 08/05/2022.
//

import UIKit

open class StackView: UIStackView {

    // MARK: - Initialization

    init(subviews: [UIView]) {
        super.init(frame: .zero)
        subviews.forEach { addArrangedSubview($0) }
    }

    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }
}
