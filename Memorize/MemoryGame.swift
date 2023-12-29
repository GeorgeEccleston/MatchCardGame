//
//  MemorizeGame.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/23/23.
//  Model

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: [Card]
    
    init(numberCardPairs: Int, createACard: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberCardPairs) {
            let card = createACard(pairIndex)
            cards.append(Card(content: card))
            cards.append(Card(content: card))
        }
    }
    
    func choose(_ card: Card   ) {
         
    }
     
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }

    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
