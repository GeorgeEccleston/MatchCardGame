//
//  MemorizeApp.swift
//  Memorize
//
//  Created by GeorgeAdmin on 12/18/23.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = EmojiVM()
    
    var body: some Scene {
        WindowGroup {
            EmojiView(gameVM: game)
        }
    }
}
