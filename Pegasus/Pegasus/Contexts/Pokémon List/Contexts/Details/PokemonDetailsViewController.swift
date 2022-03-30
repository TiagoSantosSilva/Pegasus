//
//  PokemonDetailsViewController.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

protocol PokemonDetailsViewControllerDelegate: AnyObject {
    func viewControllerDidPop(_ viewController: PokemonDetailsViewController)
}

final class PokemonDetailsViewController: ViewController {

    // MARK: - Properties

    weak var delegate: PokemonDetailsViewControllerDelegate?

    private let viewModel: PokemonDetailsViewModelable

    // MARK: - Initialization

    init(viewModel: PokemonDetailsViewModelable) {
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        delegate?.viewControllerDidPop(self)
    }
}
