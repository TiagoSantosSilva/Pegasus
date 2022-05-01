//
//  CancellableStorage.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Combine

final class CancellableStorage {

    // MARK: - Properties

    var cancellables: Set<AnyCancellable> = .init()

    static var shared: CancellableStorage = .init()

    // MARK: - Initialization

    private init() { }
}
