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

    private let scrollView: PokemonDetailsScrollView
    private let viewModel: PokemonDetailsViewModelable

    // MARK: - Initialization

    init(scrollView: PokemonDetailsScrollView, viewModel: PokemonDetailsViewModelable) {
        self.scrollView = scrollView
        self.viewModel = viewModel
        super.init()
        navigationItem.title = viewModel.name
    }

    // MARK: - Functions

    override func loadView() {
        self.view = scrollView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayDetails()
        displayImage()
    }

    deinit {
        delegate?.viewControllerDidPop(self)
    }

    // MARK: - Functions

    private func displayDetails() {
        Task {
            let result = await viewModel.loadDetails()
            switch result {
            case let .success(details):
                print("\(details) 🍒")
                scrollView.configure(with: details)
            case .failure:
                return
            }
        }
    }

    private func displayImage() {
        Task {
            let image = await viewModel.loadImage()
            scrollView.configure(with: image)
        }
    }
}
