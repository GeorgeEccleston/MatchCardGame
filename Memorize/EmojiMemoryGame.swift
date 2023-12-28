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
    private static let cars      = ["🛺","🚂","🚲","✈️","🛳️","🚗","🚌","🚑","🚔","🚜","🚓","🚒"]
    private static let fruit     = ["🍉","🍎","🍋","🧄","🥦","🍇","🌽","🥕","🍌","🥝","🌶️","🫒"]
    private static var emojis    = halloween
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberCardPairs: Int.random(in: 2 ... 12)) { cardIndex in
            if emojis.indices.contains(cardIndex) {
                return emojis[cardIndex]
            } else {
                return "⁉️ oops"
            }
        }
    }
    
    private var game = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return game.cards
    }
    
     // Choose is an intent function
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
    
    //    mutate func shuffleCards( {
    //        game.cards.shuffle()
    //    })

    func selectEmojiTheme(_ theme: String) {
        switch theme {
            case "halloween": EmojiMemoryGame.emojis = EmojiMemoryGame.halloween
            case "cars":      EmojiMemoryGame.emojis = EmojiMemoryGame.cars
            case "fruit":      EmojiMemoryGame.emojis = EmojiMemoryGame.fruit
        default: break
    }
        return
    }
}





