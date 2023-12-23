//
//  ContentView.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    let halloween = ["👽","🎃","☠️","👁️","👻","👺","👹","👀"]
    let cars = ["🛺","🚂","🚲","✈️","🛳️","🚗","🚌","🚑","🚔","🚜","🚓","🚒"]
    let fruit = ["🍉","🍎","🍋","🧄","🥦","🍇","🌽","🥕","🍌"]
    
    @State var emojis = ["Select Theme"]
    @State var cardCount = 0
    
    var body: some View {
        VStack {
            Text("Memorize Card Game").font(.title)
            Spacer()
            ScrollView {
                displayCards
            }
            HStack {
                halloweenTheme
                Spacer()
                carTheme
                Spacer()
                fruitTheme
            }
            .imageScale(.large)
            .font(.title3)
        }
        .padding(5.0)
    }
    var displayCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 150))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(emoji: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.orange)
        }
    }
    var halloweenTheme: some View {
        selectGameTheme(symbol: "person.circle.fill", symbolName: "Halloween \nTheme", emoji: halloween)
    }
    var carTheme: some View {
        selectGameTheme(symbol: "car.fill", symbolName: "Cars \nTheme", emoji: cars)
    }
    var fruitTheme: some View {
        selectGameTheme(symbol: "apple.logo", symbolName: "Fruit \nTheme", emoji: fruit)
    }
    func selectGameTheme(symbol: String, symbolName: String, emoji: [String]) -> some View {
        Button(action: {
            emojis = emoji + emoji
            emojis.shuffle()
            cardCount = emojis.count
        }, label: {
            VStack {
                Image(systemName: symbol)
                Text(symbolName )
            }
        })
    }
}

struct CardView: View {
    var emoji: String
    @State var isFaceUp = true
    
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
