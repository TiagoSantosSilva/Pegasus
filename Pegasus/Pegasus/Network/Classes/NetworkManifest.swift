//
//  NetworkManifest.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

protocol BundleDictionaryRepresentable {
    var dictionary: String { get }
}

enum NetworkManifest {
    enum PokeAPI: String, BundleDictionaryRepresentable {
        case host = "Host"
        case prePath = "Pre-Path"

        var dictionary: String { "PokeAPI" }
    }

    enum PokemonGoAPI: String, BundleDictionaryRepresentable {
        case host = "Host"
        case headers = "Headers"

        var dictionary: String { "PokemonGoAPI"}

        static let dictionary: String = "PokemonGoAPI"
    }

    enum PokemonGoAPIHeader: String, BundleDictionaryRepresentable {
        case host = "Host"
        case key = "Key"

        var dictionary: String { "Headers"}

        static func value(for key: PokemonGoAPIHeader) -> String {
            guard let networking = Bundle.main.object(forInfoDictionaryKey: Constants.key) as? [String: [String: Any]],
                  let pokemonGoAPI = networking[PokemonGoAPI.dictionary],
                  let headers = pokemonGoAPI[key.dictionary] as? [String: String],
                let value = headers[key.rawValue] else { fatalError() }
            return value
        }
    }

    enum Constants {
        static let key = "Networking"
    }

    typealias NetworkKeyable = BundleDictionaryRepresentable & RawRepresentable

    static func value<Key: NetworkKeyable>(for key: Key) -> String where Key.RawValue == String {
        guard let networking = Bundle.main.object(forInfoDictionaryKey: Constants.key) as? [String: Any],
              let dictionary = networking[key.dictionary] as? [String: String],
            let value = dictionary[key.rawValue] else { fatalError() }
        return value
    }
}
