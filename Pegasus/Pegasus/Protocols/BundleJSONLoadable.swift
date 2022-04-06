//
//  BundleJSONLoadable.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import Foundation

protocol BundleJSONLoadable {
    func json<T: Decodable>(for content: JSONContent) throws -> T
}
