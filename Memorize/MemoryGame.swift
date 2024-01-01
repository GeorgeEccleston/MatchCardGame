//
//  MemorizeGame.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/23/23.
//  Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    
    init(numberCardPairs: Int, createACard: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberCardPairs) {
            let card = createACard(pairIndex)
            cards.append(Card(content: card, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: card, id: "\(pairIndex + 1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
            print("card chosen is \(card)")   //Debug print
            
            
        }  // If nil returned then ignore and do nothing
    }
        
    // MARK: check if index of chosen card is in cards array
    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id { return index }
        }
        return nil
    }

    mutating func shuffle() {
        cards.shuffle()
//        print(cards)
    }

    struct Card: Equatable, Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
        
// TODO: todo comment
//  FIXME: Example of debug statement: requires Protocol CustomDebugStringConvertible
//        var debugDescription: String {
//         "card \(id) \(isFaceUp ? "FaceUp" : "FaceDown") \(isMatched ? "matched" : "not matched") \n"
//       }
    }
}

