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
//        var numberMatches = 0
//        var numberMisses = 0
    }
    
    var indexFirstFaceUpCard: Int? {
        get { cards.indices.filter {index in cards[index].isFaceUp }.onlyOneIndex }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id })  {
            // Match cards that are face down and not matched
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexFirstFaceUpCard {
                    // indexFirstFaceUpCard is not nil so can check if chosenCard Content matches firstCard Content
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[potentialMatchIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                } else {
                    // set indexFirstFaceUpCard to chosenIndex
                    indexFirstFaceUpCard = chosenIndex
                }
                // turn chosen card faceup
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
       
    mutating func checkCardMatch(indexFirstCard: Int, indexSecondCard: Int) {
        if cards[indexFirstCard].content == cards[indexSecondCard].content {
            print("Card Match \(indexFirstCard)  \(indexFirstCard)")   //Debug print
        }
    }

    mutating func shuffle() {
        cards.shuffle()
//        print(cards)
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp  = false    // start with all cards face down
        var isMatched = false    // and not matched
        let content: CardContent
        var id: String
        
        var debugDescription: String {
         "card \(id): \(content) \(isFaceUp ? "FaceUp" : "FaceDown") \(isMatched ? " matched" : "not matched")"
       }
    }
}

extension Array {
    var onlyOneIndex: Element? {
        return count == 1 ? first : nil
    }
}
