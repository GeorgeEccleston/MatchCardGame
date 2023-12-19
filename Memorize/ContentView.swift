//
//  ContentView.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["👽","🍎","🍋","👁️"]
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            ForEach(emojis, id: \.self) { emoji in
                CardView(emoji: emoji, isFaceUp: Bool.random())
            }
        }
        .font(.caption2)
        .foregroundColor(.orange)
        .padding()
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
            isFaceUp = !isFaceUp
        }
    }
}







 
#Preview {
    ContentView()
}
