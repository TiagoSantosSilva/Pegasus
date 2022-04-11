//
//  GalleryViewController.swift
//  Pegasus
//
//  Created by Tiago on 11/04/2022.
//

import UIKit

final class GalleryViewController: ViewController {

    // MARK: - Properties

    private let collectionViewController: GalleryCollectionViewController
    private let viewModel: GalleryViewModelable

    // MARK: - Initialization

    init(collectionViewController: GalleryCollectionViewController, viewModel: GalleryViewModelable) {
        self.collectionViewController = collectionViewController
        self.viewModel = viewModel
        super.init()
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Localizable.gallery
    }
}
