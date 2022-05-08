//
//  PokemonDetailsScrollView.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import UIKit

final class PokemonDetailsScrollView: ScrollView {

    // MARK: - Subviews

    private let imageView: UIImageView = .init()

    private let heightStackView: PokemonDetailsStatsStackView = .init()
    private let weightStackView: PokemonDetailsStatsStackView = .init()
    private let typeStackView: PokemonDetailsTypeContainerStackView = .init()

    private let testLabel: UILabel = .init()

    private let containerLayoutGuide: UILayoutGuide = .init()
    private let statsLayoutGuide: UILayoutGuide = .init()

    // MARK: - Initialization

    override init() {
        super.init()
        setup()
    }

    // MARK: - Functions

    func configure(with image: UIImage?) {
        imageView.setImage(image)
    }

    func configure(with viewModel: PokemonDetailsModelViewModel) {
        weightStackView.configure(with: viewModel.weight, for: .weight)
        heightStackView.configure(with: viewModel.height, for: .height)
        typeStackView.configure(with: viewModel.types)
    }
    
    // MARK: - Private Functions

    private func setup() {
        add(subviews: imageView, weightStackView, typeStackView, heightStackView, testLabel)
        addLayoutGuide(containerLayoutGuide)
        addLayoutGuide(statsLayoutGuide)
        setupImageView()
        setupContainerLayoutGuide()
        setupStatsLayoutGuide()
        setupWeightStackView()
        setupTypeStackView()
        setupHeightStackView()
    }

    private func setupContainerLayoutGuide() {
        containerLayoutGuide.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constraints.ImageView.top).isActive = true
        containerLayoutGuide.leadingAnchor.constraint(equalTo: frameLayoutGuide.leadingAnchor,
                                                      constant: Constraints.StatStackView.leading).isActive = true
        containerLayoutGuide.trailingAnchor.constraint(equalTo: frameLayoutGuide.trailingAnchor,
                                                       constant: -Constraints.StatStackView.trailing).isActive = true
    }

    private func setupStatsLayoutGuide() {
        statsLayoutGuide.topAnchor.constraint(equalTo: containerLayoutGuide.topAnchor).isActive = true
        statsLayoutGuide.centerXAnchor.constraint(equalTo: containerLayoutGuide.centerXAnchor).isActive = true
        statsLayoutGuide.leadingAnchor.constraint(equalTo: containerLayoutGuide.leadingAnchor).isActive = true
        statsLayoutGuide.trailingAnchor.constraint(equalTo: containerLayoutGuide.trailingAnchor).isActive = true
    }

    private func setupWeightStackView() {
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.leadingAnchor.constraint(equalTo: statsLayoutGuide.leadingAnchor).isActive = true
        weightStackView.topAnchor.constraint(equalTo: statsLayoutGuide.topAnchor).isActive = true
        weightStackView.bottomAnchor.constraint(equalTo: statsLayoutGuide.bottomAnchor).isActive = true
    }

    private func setupTypeStackView() {
        typeStackView.translatesAutoresizingMaskIntoConstraints = false
        typeStackView.leadingAnchor.constraint(equalTo: weightStackView.trailingAnchor, constant: 12).isActive = true
        typeStackView.topAnchor.constraint(equalTo: weightStackView.topAnchor).isActive = true
        typeStackView.bottomAnchor.constraint(equalTo: weightStackView.bottomAnchor).isActive = true
    }

    private func setupHeightStackView() {
        heightStackView.translatesAutoresizingMaskIntoConstraints = false
        heightStackView.leadingAnchor.constraint(equalTo: typeStackView.trailingAnchor, constant: 12).isActive = true
        heightStackView.topAnchor.constraint(equalTo: weightStackView.topAnchor).isActive = true
        heightStackView.bottomAnchor.constraint(equalTo: weightStackView.bottomAnchor).isActive = true
        //        heightStackView.trailingAnchor.constraint(equalTo: statContainer.trailingAnchor).isActive = true
    }

    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constraints.ImageView.top).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constraints.ImageView.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constraints.ImageView.height).isActive = true
        imageView.contentMode = .scaleAspectFit
    }

    private func setupTestLabel() {
        testLabel.text = "TEST TEST TEST TEST"
        testLabel.backgroundColor = .systemOrange
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constraints.StatStackView.top).isActive = true
        testLabel.trailingAnchor.constraint(equalTo: frameLayoutGuide.trailingAnchor, constant: -Constraints.StatStackView.trailing).isActive = true
    }
}

// MARK: - Constants

private extension PokemonDetailsScrollView {
    enum Constraints {
        enum ImageView {
            static let top: CGFloat = 32
            static let width: CGFloat = 200
            static let height: CGFloat = 200
        }

        enum StatStackView {
            static let top: CGFloat = 16
            static let leading: CGFloat = 16
            static let trailing: CGFloat = 16
            static let spacing: CGFloat = 32
        }
    }
}
