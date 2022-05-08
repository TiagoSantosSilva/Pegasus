//
//  String.swift
//  Pegasus
//
//  Created by Tiago on 26/03/2022.
//

import Foundation

extension String {
    static let empty: String = ""
    static let dash: String = "-"

    var firstLetterCapitalized: String {
        prefix(1).capitalized + dropFirst()
    }

    var withTrimmedLeadingZeros: String {
        replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
    }
}

extension String {
    init(reducingOneOrderOfMagnitudeFrom integer: Int) {
        var formattedString = String(integer)
        let penultimateIndex = formattedString.index(before: formattedString.endIndex)
        let startIndex = formattedString.startIndex
        let isPenultimateIndexSameAsStartIndex = startIndex == penultimateIndex
        formattedString.insert(".", at: penultimateIndex)

        guard isPenultimateIndexSameAsStartIndex else {
            self = formattedString
            return
        }

        formattedString.insert("0", at: startIndex)

        self = formattedString
    }
}
