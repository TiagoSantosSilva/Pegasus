//
//  PokemonListViewModel.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

protocol PokemonRegionRepresentable: AnyObject {
    var regions: [Region] { get }
}

protocol PokemonListViewModelable: PokemonRegionRepresentable {
    func loadRegions(completion: @escaping (PokemonListResult) -> Void)
}

enum PokemonListResult {
    case success
    case error
}

final class PokemonListViewModel: PokemonListViewModelable {

    // MARK: - Properties

    private(set) var regions: [Region] = []

    private let loader: PokemonListLoadable

    // MARK: - Initialization

    init(loader: PokemonListLoadable) {
        self.loader = loader
    }

    // MARK: - Functions

    func loadRegions(completion: @escaping (PokemonListResult) -> Void) {
        Task {
            do {
                let result = try await loader.loadRegions()
                self.regions = result
                
                completion(.success)
            } catch {
                completion(.error)
            }
        }
    }
}
