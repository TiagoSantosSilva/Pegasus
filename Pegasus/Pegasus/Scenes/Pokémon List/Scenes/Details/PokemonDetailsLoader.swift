//
//  PokemonDetailsLoader.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol PokemonDetailsLoadable: AnyObject {
    func loadImage(number: String) async throws -> UIImage
}

final class PokemonDetailsLoader: PokemonDetailsLoadable {

    // MARK: - Properties

    private let networkEngine: NetworkEnginable

    // MARK: - Initialization

    init(dependencies: DependencyContainable) {
        self.networkEngine = dependencies.networkEngine
    }

    // MARK: - Functions

    func loadImage(number: String) async throws -> UIImage {
        let data = try await networkEngine.request(endpoint: PokemonEndpoint.image(number: number))
        guard let image = UIImage(data: data) else {
            throw UIImageError.initializationFromDataFailed
        }
        
        guard let preparedImage = await image.byPreparingForDisplay() else {
            throw UIImageError.initializationFromDataFailed
        }
        return preparedImage
    }
}
