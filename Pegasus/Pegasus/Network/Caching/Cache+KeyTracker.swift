//
//  Cache+KeyTracker.swift
//  Pegasus
//
//  Created by Tiago on 15/05/2022.
//

import Foundation

extension Cache {
    final class KeyTracker: NSObject, NSCacheDelegate {

        // MARK: - Properties

        var keys = Set<Key>()

        // MARK: - Functions

        func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject object: Any) {
            guard let entry = object as? Entry else {
                return
            }
            
            keys.remove(entry.key)
        }
    }
}
