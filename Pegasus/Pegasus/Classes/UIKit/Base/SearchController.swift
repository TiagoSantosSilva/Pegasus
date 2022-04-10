//
//  SearchController.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import UIKit

open class SearchController: UISearchController {

    // MARK: - Initialization

    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        setup()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Functions

    private func setup() {
        obscuresBackgroundDuringPresentation = false
        hidesNavigationBarDuringPresentation = false
    }
}
