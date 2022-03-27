//
//  MainActor.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import Foundation

extension MainActor {

    /// Execute the given body closure on the main actor.
    public static func run<T>(resultType: T.Type = T.self, body: @MainActor @Sendable () throws -> T) async rethrows -> T {
        try await body()
    }
}
