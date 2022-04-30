//
//  URL.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}
