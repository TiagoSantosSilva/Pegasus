//
//  DependencyContainer.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import Foundation

protocol DependencyContainable: AnyObject {
    var networkEngine: NetworkEnginable { get }
    var themeEnvironment: ThemeEnvironmentable { get }
}

final class DependencyContainer: DependencyContainable {

    // MARK: - Properties

    let networkEngine: NetworkEnginable
    let themeEnvironment: ThemeEnvironmentable

    // MARK: - Initialization

    init() {
        let networkBuilder = NetworkRequestBuilder()
        let networkParser = NetworkResponseParser()
        self.networkEngine = NetworkEngine(builder: networkBuilder, parser: networkParser)
        self.themeEnvironment = ThemeEnvironment.shared
    }
}
