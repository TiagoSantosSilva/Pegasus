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

        var dictionary: String { "PokemonGoAPI"}
    }

    enum Constants {
        static let key = "Networking"
    }
    typealias NetworkKeyable = BundleDictionaryRepresentable & RawRepresentable

    static func value<Key: NetworkKeyable>(for key: Key) -> String where Key.RawValue == String {
        guard let networking = Bundle.main.object(forInfoDictionaryKey: Constants.key) as? [String: [String: String]],
              let dictionary = networking[key.dictionary],
            let value = dictionary[key.rawValue] else { fatalError() }
        return value
    }
}
