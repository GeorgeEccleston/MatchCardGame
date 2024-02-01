//
//  Theme.swift
//  Memorize
//
//  Created by GeorgeAdmin on 1/14/24.
//

import Foundation

struct Theme {
    var name: String
    var emojis: [String]
    var numberPairsCards: Int
    var color: String
    
    init(name: String, emojis: [String], numberPairsCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberPairsCards = numberPairsCards
        self.color = color
        if numberPairsCards > emojis.count { self.numberPairsCards = emojis.count }
    }
}
