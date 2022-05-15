//
//  Cache+Entry.swift
//  Pegasus
//
//  Created by Tiago on 15/05/2022.
//

import Foundation

extension Cache {
    final class Entry {

        // MARK: - Properties

        let key: Key
        let value: Value
        let expirationDate: Date

        // MARK: - Initialization

        init(key: Key, value: Value, expirationDate: Date) {
            self.key = key
            self.value = value
            self.expirationDate = expirationDate
        }
    }
}

extension Cache.Entry: Codable where Key: Codable, Value: Codable { }
