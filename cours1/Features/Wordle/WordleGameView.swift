//
//  WordleGameView.swift
//  cours1
//
//  Created by LETARD Pierric on 05/11/2025.
//


import SwiftUI
import DesignSystem

public struct WordleGameView: View {
    init(gameModel: WordleGameViewModel = WordleGameViewModel()) {
        self.gameModel = gameModel
    }
    @ObservedObject var gameModel: WordleGameViewModel
    
    public var body: some View {
        WordGridView(rows: gameModel.currentGame?.grid ?? defautlGrid)
            .padding()
        Spacer()
        
        KeyboardView(keys: gameModel.keyboard) { key in
            gameModel.tap(key: key)
        }
        .navigationTitle("Wordle")
        .navigationBarTitleDisplayMode(.inline)
    }
}
