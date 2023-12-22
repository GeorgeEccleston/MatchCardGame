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
                Spacer()
                Button(action: {
                    emojis = halloween + halloween
                    emojis.shuffle()
                    cardCount = emojis.count
                    print("Halloween Theme - Number Cards = \(cardCount)")
                }, label: {
                    VStack {
                        Image(systemName: "person.circle.fill")
                        Text("Halloween Theme")
                    }
                })
                    Spacer()
                    Button(action: {
                        emojis = cars + cars
                        emojis.shuffle()
                        cardCount = emojis.count
                        print("Car Theme - Number Cards = \(cardCount)")
                    }, label: {
                        VStack {
                            Image(systemName: "car.fill")
                            Text("Cars Theme")

                        }
                    })
                    Spacer()
                    Button(action: {
                        emojis = fruit + fruit
                        cardCount = emojis.count
                        emojis.shuffle()
                        print("Fruit Theme - Number Cards = \(cardCount)")
                    }, label: {
                        VStack {
                            Image(systemName: "apple.logo")
                            Text("Fruit Theme")
                        }
                    })
                Spacer()
            }
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
