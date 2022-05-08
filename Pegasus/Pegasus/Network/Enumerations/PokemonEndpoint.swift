//
//  PokemonEndpoint.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import Foundation

enum PokemonEndpoint: Endpoint {
    case details(number: String)
    case list(offset: Int, limit: Int)
    case released
    case image(number: String)
}

extension PokemonEndpoint {
    var host: String {
        switch self {
        case .list, .details:
            return "pokeapi.co"
        case .released:
            return NetworkManifest.value(for: NetworkManifest.PokemonGoAPI.host)
        case .image:
            return "raw.githubusercontent.com"
        }
    }

    var path: String {
        switch self {
        case .details:
            return "/api/v2/"
        case .list:
            return NetworkManifest.value(for: NetworkManifest.PokeAPI.prePath)
        case .released:
            return .empty
        case .image:
            return "/PokeAPI/sprites/master/sprites/pokemon/other/"
        }
    }

    var endpoint: String {
        switch self {
        case let .details(number):
            return "pokemon/\(number)"
        case .list:
            return "pokemon"
        case .released:
            return "released_pokemon.json"
        case let .image(number):
            return "official-artwork/\(number).png"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case let .list(offset, limit):
            return [.init(name: QueryKey.offset, value: String(describing: offset)),
                    .init(name: QueryKey.limit, value: String(describing: limit))]
        case .released, .image, .details:
            return nil
        }
    }

    var headers: [HTTPHeader] {
        switch self {
        case .list, .image, .details:
            return []
        case .released:
            return [[HeaderKey.PokemonGo.host: NetworkManifest.PokemonGoAPIHeader.value(for: .host),
                     HeaderKey.PokemonGo.key: NetworkManifest.PokemonGoAPIHeader.value(for: .key)]]
        }
    }
}
