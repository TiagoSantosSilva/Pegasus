//
//  PokemonDetailsViewModel.swift
//  Pegasus
//
//  Created by Tiago on 30/03/2022.
//

import UIKit

protocol PokemonDetailsDataRepresentable: AnyObject {
    var name: String { get }

    func loadDetails() async -> Result<PokemonDetailsModelViewModel, Error>
    func loadImage() async -> UIImage?
}

typealias PokemonDetailsViewModelable = PokemonDetailsDataRepresentable

final class PokemonDetailsViewModel: PokemonDetailsViewModelable {

    // MARK: - Properties

    let name: String

    private let pokemon: PokemonListCellViewModel
    private let loader: PokemonDetailsLoadable

    // MARK: - Initialization

    init(pokemon: PokemonListCellViewModel, loader: PokemonDetailsLoadable) {
        self.pokemon = pokemon
        self.name = pokemon.name
        self.loader = loader
    }

    // MARK: - Functions

    func loadDetails() async -> Result<PokemonDetailsModelViewModel, Error> {
        do {
            let details = try await loader.loadDetails(number: pokemon.number)
            return .success(PokemonDetailsModelViewModel(raw: details))
        } catch {
            return .failure(NetworkError.noData)
        }
    }

    func loadImage() async -> UIImage? {
        do {
            let image = try await loader.loadImage(number: pokemon.number)
            return image
        } catch {
            return nil
        }
    }
}
