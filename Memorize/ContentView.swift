//
//  ContentView.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👽","🍎","🍋","👁️","👻","👄","🧵","👠","👀","💍","🏈","🥌"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            displayCards
            Spacer()
            updateNumberCards
        }
        .padding(5.0)
    }
    var displayCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 150))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(emoji: emojis[index], isFaceUp: Bool.random())
            }
        }
        .foregroundColor(.orange)
    }
    var updateNumberCards: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.title3)
    }
    func addRemoveACard(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
            print("cardCount \(cardCount)")
        }, label: {
                Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardAdder: some View {
        addRemoveACard(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    var cardRemover: some View {
        addRemoveACard(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
}

struct CardView: View {
    var emoji: String = "???"
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                cardShape.fill(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(emoji).font(.largeTitle)
            } else {
                cardShape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}








#Preview {
    ContentView()
}
