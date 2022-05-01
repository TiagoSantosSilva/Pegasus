//
//  UserDefault.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

@propertyWrapper
struct UserDefault<Value: Codable> {
    let key: String
    let defaultValue: Value
    let container: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            guard let data = container.object(forKey: key) as? Data,
                  let value = try? JSONDecoder().decode(Value.self, from: data) else { return defaultValue }
            return value
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else { return }
            container.set(data, forKey: key)
        }
    }
}
