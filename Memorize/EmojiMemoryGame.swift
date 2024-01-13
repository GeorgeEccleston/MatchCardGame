//
//  EmojiMemoryGameVM.swift
//  Memorize ViewModel
//  Created by GeorgeAdmin on 12/23/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let halloween = ["👽","🎃","☠️","👁️","👻","👺","👹","👀","🕷️","🪱","🐸","🐈‍⬛"]
    private static let cars      = ["🛺","🚂","🚲","✈️","🛳️","🚗","🚌","🚑","🚔","🚜","🚓","🚒"]
    private static let fruit     = ["🍉","🍎","🍋","🧄","🥦","🍇","🌽","🥕","🍌","🥝","🌶️","🫒"]
    private static let emojiArray = [halloween, cars, fruit]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = emojiArray.randomElement()!  // emojiArray is not empty, force unwarp optional element from array
//        let selectEmoji = Int.random(in: 1...3)
//        switch selectEmoji {
//            case 1:  let emojis = halloween
//            case 2:  let emojis = cars
//            case 3:  let emojis = fruit
//            default: let emojis = halloween
//        }
        return MemoryGame(numberCardPairs: Int.random(in: 4 ... 12)) { cardIndex in
            if emojis.indices.contains(cardIndex) {
                return emojis[cardIndex]
            } else {
                return "⁉️ oops"
            }
        }
    }
    
    @Published private var game = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return game.cards
    }
    
     // Choose is an intent function
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
//    Mark - Intents
    
    func shuffleCards() {
        game.shuffle()
    }
}





