//
//  EmojiGameVM.swift
//  ViewModel for Memorize game
//  Created by GeorgeAdmin on 12/23/23.
//

import SwiftUI

class EmojiVM: ObservableObject {

    init() {
        theme = EmojiVM.themes.randomElement()!  // force unwrap OK since no empty theme.emoji arrays
        theme.emojis.shuffle()
        game = EmojiVM.createMemoryGame(theme: theme)
    }
    
    var cards: [Game<String>.Card] { return game.cards }
    var score: Int { return game.score }
    var themeName:  String { return theme.name }
    var themeColor: Color  {
        switch theme.color {
            case "yellow": return .yellow
            case "red":    return .red
            case "green":  return .green
            case "blue":   return .blue
            case "purple": return .purple
            default:       return .black
        }
    }

    private var theme: Theme
    static var themes: Array<Theme> = [
        Theme(name: "cars", emojis: ["🛺","🚂","🚲","✈️","🛳️","🚗","🚌","🚑","🚔","🚜","🚓","🚒"],
               numberPairsCards: 12, color: "yellow"
            ),
        Theme(name: "fruit", emojis: ["🍉","🍎","🍋","🧄","🥦","🍇","🌽","🥕","🍌","🥝","🌶️","🫒"],
               numberPairsCards: 10, color: "red"
            ),
        Theme( name: "halloween", emojis: ["👽","🎃","☠️","👁️","👻","👺","👹","👀","🕷️","🪱","🐸","🐈‍⬛"],
               numberPairsCards: 8, color: "green"
            ),
        Theme( name: "faces", emojis: ["😎","🥸","🥵","🤮","😱","😇","🤠"],
               numberPairsCards: 8, color: "blue"
            ),
        Theme( name: "hearts", emojis: ["🩷","💚","🖤","💔","💝","💞","💛","💟","❣️"],
               numberPairsCards: 9, color: "blue"
               )
    ]
    
    static func createMemoryGame(theme: Theme) -> Game<String> {
        Game(numberOfPairsOfCards: theme.numberPairsCards) { cardIndex in
             theme.emojis[cardIndex]
            }
        }
    
    @Published private var game = EmojiVM.createMemoryGame(theme: EmojiVM.themes.randomElement()!)
    
    // Mark - User Intents
    func choose(_ card: Game<String>.Card) {
        game.choose(card)
    }
//    Mark - Intents
    
    func newGame() {
        theme = EmojiVM.themes.randomElement()!
        theme.emojis.shuffle()
        game = EmojiVM.createMemoryGame(theme: theme)
    }
}





