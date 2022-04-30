//
//  CollectionViewListCell.swift
//  Pegasus
//
//  Created by Tiago on 10/04/2022.
//

import UIKit

open class CollectionViewListCell: UICollectionViewListCell {

    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    func animateSelection() {
        setBackgroundColor(Color.highlightedCell)
        UIView.animate(withDuration: Constants.deselectAnimationDuration) {
            self.setBackgroundColor(Color.cell)
        }
    }

    // MARK: - Private Functions

    private func setupStyle() {
        setBackgroundColor(Color.cell)
    }

    private func setBackgroundColor(_ color: UIColor) {
        var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfig.backgroundColor = color
        backgroundConfiguration = backgroundConfig
    }
}

// MARK: - Constants

private extension CollectionViewListCell {
    enum Constants {
        static let deselectAnimationDuration: TimeInterval = 0.4
    }
}
