//
//  MemoryGameView.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/18/23.
//

import SwiftUI

struct MemoryGameView: View {
    var game: EmojiMemoryGame  // points back into ViewModel to check for changes in Model
    
    @State var gameTheme = "Select Card Game Theme"
    @State var emojis: [String] = []
    @State var cardCount = 0
    
    var body: some View {
        VStack {
            Text("Memorize Card Game").font(.title)
            Text("\(gameTheme)")
            Spacer()
            ScrollView {
                displayCards
            }
//            displayThemeButtons
//            .imageScale(.large)
//            .font(.title3)
        }
        .padding(5.0)
    }
    var displayCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 150))]) {
            ForEach(game.cards.indices, id: \.self) { index in
                CardView(card: game.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.orange)
        }
    }
    
//    var displayThemeButtons: some View {
//        HStack {
//            halloweenTheme
//            Spacer()
//            carTheme
//            Spacer()
//            fruitTheme
//        }
//    }
//    var halloweenTheme: some View {
//        selectGameTheme(symbol: "person.circle.fill", symbolName: "Halloween", emoji: halloween)
//    }
//    var carTheme: some View {
//        selectGameTheme(symbol: "car.fill", symbolName: "Cars", emoji: cars)
//    }
//    var fruitTheme: some View {
//        selectGameTheme(symbol: "apple.logo", symbolName: "Fruit", emoji: fruit)
//    }
//    func selectGameTheme(symbol: String, symbolName: String, emoji: [String]) -> some View {
//        Button(action: {
//            emojis = emoji + emoji
//            emojis.shuffle()
//            cardCount = emojis.count
//            gameTheme = "Match Cards with the same \(symbolName)"
//        }, label: {
//            VStack {
//                Image(systemName: symbol)
//                Text(symbolName)
//            }
//        })
//    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 12)
            Group {
//                cardShape.fill(.white)
//                cardShape.strokeBorder(lineWidth: 3)
                Text(card.face).font(Font.largeTitle)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            cardShape.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}
 







#Preview {
    MemoryGameView()
}
