//
//  Endpoint.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

protocol Endpoint {
    var baseURL: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
}
