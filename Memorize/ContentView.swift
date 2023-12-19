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
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(emoji: emojis[index], isFaceUp: Bool.random())
                }
            }
            .foregroundColor(.orange)

            HStack {
                cardAdder
                Spacer()
                cardRemover
            }
            .imageScale(.large)
            .font(.title3)
        }
        .padding(5.0)
    }
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count { cardCount += 1 }
        }, label: {
            VStack{
                Image(systemName: "rectangle.stack.fill.badge.plus")
                Text("Add Card")
            }
            .background(.white)
        })
    }
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 { cardCount -= 1 }
        }, label: {
            VStack {
                Image(systemName: "rectangle.stack.fill.badge.minus")
                Text("Remove Card")
            }
            .background(.white)
        })
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
