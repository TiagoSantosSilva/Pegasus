//
//  PokemonEndpoint.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

enum PokemonEndpoint: Endpoint {
    case list(offset: Int, limit: Int)
    case released
}

extension PokemonEndpoint {
    var host: String {
        switch self {
        case .list:
            return NetworkManifest.value(for: NetworkManifest.PokeAPI.host)
        case .released:
            return NetworkManifest.value(for: NetworkManifest.PokemonGoAPI.host)
        }
    }

    var path: String {
        switch self {
        case .list:
            return NetworkManifest.value(for: NetworkManifest.PokeAPI.prePath)
        case .released:
            return .empty
        }
    }

    var endpoint: String {
        switch self {
        case .list:
            return "pokemon"
        case .released:
            return "released_pokemon.json"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case let .list(offset, limit):
            return [.init(name: QueryKey.offset, value: String(describing: offset)),
                    .init(name: QueryKey.limit, value: String(describing: limit))]
        case .released:
            return []
        }
    }

    var headers: [HTTPHeader] {
        switch self {
        case .list:
            return []
        case .released:
            return [[HeaderKey.PokemonGo.host: NetworkManifest.PokemonGoAPIHeader.value(for: .host),
                     HeaderKey.PokemonGo.key: NetworkManifest.PokemonGoAPIHeader.value(for: .key)]]
        }
    }
}
