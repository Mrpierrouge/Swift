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
        
        KeyboardView { key in
            switch key.type {
            case .letter(let l):
                print("Lettre tapée : \(l)")
            case .enter:
                print("Entrée")
            case .delete:
                print("Effacer")
            }
        }
        .navigationTitle("Wordle")
        .navigationBarTitleDisplayMode(.inline)
    }
}
