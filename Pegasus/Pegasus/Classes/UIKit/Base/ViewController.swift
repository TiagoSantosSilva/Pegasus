//
//  ViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

open class ViewController: UIViewController {

    // MARK: - Initialization

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(StringError.coderInit)
    }

    // MARK: - Life Cycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.background
    }
}
