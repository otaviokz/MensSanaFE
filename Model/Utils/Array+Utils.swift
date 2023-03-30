//
//  Array+Utils.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 29/03/2023.
//

import Foundation

extension Array where Element: Hashable {
    var uniqueValuesOnly: [Element] {
        Array<Element>(Set(self))
    }
}
