//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/23/23.
//  ViewModel

import SwiftUI

class EmojiMemoryGame {
    // global name space
    private static let halloween = ["👽","🎃","☠️","👁️","👻","👺","👹","👀","🕷️","🪱","🐸","🐈‍⬛"]
    private static let cars = ["🛺","🚂","🚲","✈️","🛳️","🚗","🚌","🚑","🚔","🚜","🚓","🚒"]
    private static let fruit = ["🍉","🍎","🍋","🧄","🥦","🍇","🌽","🥕","🍌","🥝","🌶️","🫒"]
    private static let emojis = halloween
    
    private static let numberCardPairs = Int.random(in: 2 ... 10)
    
    private static func createACard(numberCardPairs index: Int) -> String {
        return emojis[index]
    }
    
//    private static func createMemoryGame() -> MemoryGame<String> {
//        return MemoryGame<String>(numberCardPairs: 4) { pairIndex in
//            if emojis.indices.contains(pairIndex) {
//                return emojis[pairIndex]
//            } else {
//                return "⁉️ oops"
//            }
//        } 
//    }

    private var game = MemoryGame(numberCardPairs: Int.random(in: 2 ... 12)) { index in
            return emojis[index]
        }
    
    var cards: [MemoryGame<String>.Card] {
        return game.cards
    }
    
     // Choose is an intent function
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
    
    func selectEmojiTheme(emojiName: String) -> Array<String> {
        return [emojiName]
    }
}





