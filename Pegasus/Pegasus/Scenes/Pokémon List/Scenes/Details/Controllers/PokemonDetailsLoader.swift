//
//  PokemonDetailsLoader.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol PokemonDetailsLoadable: AnyObject {
    func loadDetails(number: String) async throws -> PokemonDetailsModel
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

    func loadDetails(number: String) async throws -> PokemonDetailsModel {
        try await networkEngine.request(endpoint: PokemonEndpoint.details(number: number.withTrimmedLeadingZeros)) as PokemonDetailsModel
    }

    func loadImage(number: String) async throws -> UIImage {
        let data = try await networkEngine.request(endpoint: PokemonEndpoint.image(number: number.withTrimmedLeadingZeros))
        guard let image = UIImage(data: data) else {
            throw UIImageError.initializationFromDataFailed
        }
        
        guard let preparedImage = await image.byPreparingForDisplay() else {
            throw UIImageError.initializationFromDataFailed
        }
        return preparedImage
    }
}
