//
//  Coordinator.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import Foundation

public typealias Coordinator = CoordinatorClass & Coordinatable

public protocol CoordinatorDelegate: AnyObject {
    func coordinatorDidEnd(_ coordinator: Coordinator)
}

public protocol Coordinatable {
    func start()
}

open class CoordinatorClass: NSObject, CoordinatorDelegate {

    // MARK: - Properties

    public weak var coordinatorDelegate: CoordinatorDelegate?
    public lazy var coordinators: [Coordinator] = []

    // MARK: - Functions

    @discardableResult
    public func initiate(coordinator: Coordinator) -> Coordinator {
        coordinator.coordinatorDelegate = self
        coordinators.append(coordinator)
        coordinator.start()
        return coordinator
    }

    // MARK: - Coordinator Delegate
    
    public func coordinatorDidEnd(_ coordinator: Coordinator) {
        coordinators = coordinators.filter { $0 !== coordinator }
    }
}
