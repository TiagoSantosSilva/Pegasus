//
//  Bundle.swift
//  Pegasus
//
//  Created by Tiago on 31/03/2022.
//

import Foundation

extension Bundle: BundleJSONLoadable {
    func json<T: Decodable>(for content: JSONContent) throws -> T {
        guard let path = path(forResource: content.rawValue, ofType: "json") else { throw NetworkError.noData }
        let content = try String(contentsOfFile: path)
        return try JSONDecoder().decode(T.self, from: Data(content.utf8))
    }
}
