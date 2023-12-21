//
//  ContentView.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👽","🍎","🍋","👁️","👻","👄","🧵","👠","👀","💍","🏈","🥌"]
    @State var cardCount = 12
    
    var body: some View {
        VStack {
            Text("Memorize Card Game").font(.largeTitle)
            Spacer()
            ScrollView {
                displayCards
            }
        }
        .padding(5.0)
    }
    var displayCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 150))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(emoji: emojis[index], isFaceUp: Bool.random())
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var emoji: String = "???"
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 10)
            Group {
                cardShape.fill(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(emoji).font(.largeTitle)
            }
            cardShape.fill().opacity(isFaceUp ? 1 : 0)
        }
        .onTapGesture {
            isFaceUp.toggle()
            
        }
    }
}








#Preview {
    ContentView()
}
