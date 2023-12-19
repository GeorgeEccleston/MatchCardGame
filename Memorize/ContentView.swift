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
            ForEach(0...3) { index in
                CardView(emoji: emojis[index], isFaceUp: true)
            }
                
//            CardView(emoji: emojis[1], isFaceUp: false)
//            CardView(emoji: emojis[2], isFaceUp: true)
//            CardView(emoji: emojis[3], isFaceUp: true)
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct CardView: View {
    let emoji: String
    var isFaceUp = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(lineWidth: 3)
                Text(emoji)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
            }
        }
    }
}








#Preview {
    ContentView()
}
