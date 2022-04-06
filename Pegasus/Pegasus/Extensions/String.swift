//
//  String.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import Foundation

extension String {
    static var empty: String = ""

    var firstLetterCapitalized: String {
        prefix(1).capitalized + dropFirst()
    }
}
