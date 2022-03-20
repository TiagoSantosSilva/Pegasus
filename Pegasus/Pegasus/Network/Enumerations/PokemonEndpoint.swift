//
//  PokemonEndpoint.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

enum PokemonEndpoint: Endpoint {
    case list

    var baseURL: String {
        "https://pokeapi.co/api/v2/"
    }

    var endpoint: String {
        "pokemon"
    }

    var method: HTTPMethod {
        .get
    }
}
