//
//  MockBundle.swift
//  PegasusTests
//
//  Created by Tiago on 31/03/2022.
//

import Foundation
@testable import Pegasus

final class MockBundle: BundleJSONLoadable {

    // MARK: - Properties

    var handler: ((JSONContent) -> Decodable)?

    // MARK: - Functions
    
    func json<T: Decodable>(for content: JSONContent) throws -> T {
        guard let handler = handler, let data = handler(content) as? T else { fatalError() }

        return data
    }
}
