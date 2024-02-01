//
//  EmojiMemoryGameView.swift
//  Memorize
//  Created by GeorgeAdmin on 12/18/23.

import SwiftUI
struct EmojiView: View {
    @ObservedObject var gameVM: EmojiVM  // Looks at VM for changes in game
    var body: some View {
        HStack {
            Text("Match \(gameVM.themeName)")
            Spacer()
            Text("Score: \(gameVM.score)")
            Spacer()
            //                Text("Cards Matched \(gameVM.matched)")
        }
        .font(.headline)
        .padding()
        
        VStack {
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
        .padding(3.0)
    }
    
    var displayCards: some View {
        GeometryReader { geometry in
            let gridItemSize = fitTheCards(cardCount: gameVM.cards.count, size: geometry.size, atAspectRatio: 2/3)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize),  spacing: 0)], spacing: 0) {
                ForEach(gameVM.cards) { card in
                    VStack {
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(4)
                            .onTapGesture {
                                gameVM.choose(card)
                            }
                        // TODO: show card id under the card
                        // Text(card.id).fontWeight(.bold).foregroundColor(Color.black)
                    }
                }
            }
        }
//        .foregroundColor(.orange)   // FIXME: Original card color is .orange
        .foregroundColor(gameVM.themeColor)
    }
    
    func fitTheCards(cardCount: Int, size: CGSize, atAspectRatio aspectRatio: CGFloat) -> CGFloat {
        let cardCount = CGFloat(cardCount)
        var colCount = 1.0
        repeat {
            let cardWidth =  size.width / colCount
            let cardHeight = cardWidth / aspectRatio
            let rowCount = cardCount / colCount.rounded(.up)
            print("colCount: \(colCount)  cardWidth: \(cardWidth)  cardHeight:\(cardHeight)  rowCount: \(rowCount) ")
            
            if rowCount * cardHeight < size.height {
                return size.width / colCount.rounded(.down)
            }
            colCount += 1
        } while colCount < cardCount
        return min(size.width / cardCount, size.height * aspectRatio).rounded(.down)
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
