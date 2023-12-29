//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/18/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame  // points back into ViewModel to check for changes in Model
    
    @State var gameTheme = "Select Card Game Theme"
    @State var emojis: [String] = []
    @State var cardCount = 0
    
    var body: some View {
        VStack {
            Text("Memorize Card Game").font(.title)
            Text("Match Cards")
            Spacer()
            ScrollView {
                displayCards
            }
            Spacer()
            Button("Shuffle Cards") {
                game.shuffleCards()
            }
         
        }
        .padding(5.0)
    }
    var displayCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 150), spacing: 0)], spacing: 0) {
            ForEach(game.cards.indices, id: \.self) { index in
                CardView(game.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
            .foregroundColor(.orange)
        }
    }
           

}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 12)
            Group {
                cardShape.fill(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            cardShape.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}
 







#Preview {
    EmojiMemoryGameView(game: EmojiMemoryGame())
}
