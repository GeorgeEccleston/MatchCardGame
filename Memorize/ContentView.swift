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
            updateNumberCards
        }
        .padding(5.0)
    }
    var displayCards: some View {
        HStack {
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
        }, label: {
            VStack{
                Image(systemName: symbol)
                Text("Add Card")
            }
            .background(.white)
        })
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
