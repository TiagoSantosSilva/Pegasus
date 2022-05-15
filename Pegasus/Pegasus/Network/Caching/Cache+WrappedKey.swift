//
//  Cache+WrappedKey.swift
//  Pegasus
//
//  Created by Tiago on 15/05/2022.
//

import Foundation

extension Cache {
    final class WrappedKey: NSObject {

        // MARK: - Properties

        let key: Key

        override var hash: Int {
            key.hashValue
        }

        // MARK: - Initialization

        init(_ key: Key) {
            self.key = key
        }

        // MARK: - Functions

        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }

            return value.key == key
        }
    }
}
