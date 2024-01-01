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
        var numCardsSelected = 0
        var indexFirstCard: Int = 0
        let match = false
        var numberMatches = 0
        var numberMisses = 0

        if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
            numCardsSelected += 1
            if numCardsSelected == 1 {indexFirstCard = chosenIndex}
            if numCardsSelected == 2 && indexFirstCard != chosenIndex {
                let match = checkCardMatch(firstCard: indexFirstCard, secondCard: chosenIndex)
            }
            if match {
                numberMatches += 1
                cards.remove(at: indexFirstCard)
                cards.remove(at: chosenIndex)
            } else {
                numberMisses += 1
                cards[indexFirstCard].isFaceUp.toggle()
                cards[chosenIndex].isFaceUp.toggle()
            }
            print("card chosen is \(card)")   //Debug print
        }  // If nil returned then ignore and do nothing
    }
    
    func checkCardMatch(firstCard: Int, secondCard: Int) -> Bool {
        if firstCard == secondCard {
            return true
        }
        return false
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

