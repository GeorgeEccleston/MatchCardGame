//
//  EmojiMemoryGameView.swift
//  Memorize
//  Created by GeorgeAdmin on 12/18/23.

import SwiftUI
struct EmojiView: View {
    @ObservedObject var gameVM: EmojiVM  // Looks at VM for changes in game
    
    var body: some View {
        VStack {
            HStack {
                Text(gameVM.themeName)
                Spacer()
                Text("Score: \(gameVM.score)")
            }
            .font(.headline)
            .padding()
            
            ScrollView {
                displayCards
                    .animation(.default, value: gameVM.cards)
            }
            .foregroundColor(gameVM.themeColor)
            
            Spacer()

            Button {
                gameVM.newGame()
            } label: {
                Text("New Game")
                    .font(.largeTitle)
            }
        }
        .padding(5.0)
    }
    var displayCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90),spacing: 0)], spacing: 0) {
            ForEach(gameVM.cards) { card in
                VStack {
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            gameVM.choose(card)
                        }
                    // TODO: show card id under the card
//                    Text(card.id)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.black)
                }
            }
            // FIXME: Original fixed theme color was .orange
            .foregroundColor(gameVM.themeColor)
        }
    }
}

struct CardView: View {
    let card: Game<String>.Card
    
    init(_ card: Game<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            Group {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            shape.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
 







#Preview {
    EmojiView(gameVM: EmojiVM())
}
