//
//  DependencyContainer.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import Foundation

protocol DependencyContainable: AnyObject {
    var networkEngine: NetworkEnginable { get }
}

final class DependencyContainer: DependencyContainable {

    // MARK: - Properties

    let networkEngine: NetworkEnginable

    // MARK: - Initialization

    init() {
        let networkParser = NetworkResponseParser()
        self.networkEngine = NetworkEngine(parser: networkParser)
    }
}
