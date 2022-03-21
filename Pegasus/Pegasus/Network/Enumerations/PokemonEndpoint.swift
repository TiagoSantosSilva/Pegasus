//
//  PokemonEndpoint.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

enum PokemonEndpoint: Endpoint {
    case list(offset: Int, limit: Int)
}

extension PokemonEndpoint {
    var host: String {
        switch self {
        case .list:
            return NetworkManifest.value(for: NetworkManifest.PokeAPI.host)
        }
    }

    var path: String {
        switch self {
        case .list:
            return NetworkManifest.value(for: NetworkManifest.PokeAPI.prePath)
        }
    }

    var endpoint: String {
        switch self {
        case .list:
            return "pokemon"
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
        }
    }
}
