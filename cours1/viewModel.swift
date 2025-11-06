//
//  viewModel.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//
import SwiftUI
import DesignSystem

@Observable
class ViewModel {
    var counter: Int = 0 {
        didSet {
            title1 = "Tu as cliqué \(counter) fois sur le bouton"
            title2 = "Bon anniversaire ! \(counter) clic, tu es grand maintenant !"
        }
    }
    var viewTitle: String = "Clic moi !"
    var title1: String = "Tu as cliqué X fois sur le bouton"
    var title2: String = "Bon anniversaire !"
    
}

struct WordleHomePageView: View {
    @StateObject var wordleGame = WordleGameViewModel()
    @StateObject var dailyGame = WordleGameViewModel()
    @State private var navigateToGame = false
    @State private var navigateToDaily = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("Wordle")
                    .font(.largeTitle.bold())
                    .padding(.top, 40)
                
                WordGridView(rows: defautlGrid)
                    .padding(.horizontal)
                    .frame(maxHeight: 300)
                    .opacity(0.7)
                
                Spacer()
                
                Button {
                    if dailyGame.currentGame == nil || (dailyGame.currentGame?.isOver == true) {
                        dailyGame.startNewGame(daily: true)
                    }
                    navigateToDaily = true
                } label: {
                    Text("Daily Game")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                }
                
                Button {
                    if wordleGame.currentGame == nil || (wordleGame.currentGame?.isOver == true) {
                        wordleGame.startNewGame(daily: false)
                    }
                    navigateToGame = true
                } label: {
                    Text("Jouer")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                }
                
            }
            .navigationDestination(isPresented: $navigateToGame) {
                WordleGameView(gameModel: wordleGame)
            }
            .navigationDestination(isPresented: $navigateToDaily) {
                WordleGameView(gameModel: dailyGame)
            }
            .task {
                if wordleGame.words.isEmpty {
                    //Je fetch les mots 50 par 50 pour réduire le nombre de connexion. J'utilise ensuite les mots dans une liste locale
                    print("fetching 50 words")
                    wordleGame.words = await wordleGame.getWord(count: 50)
                }
                if dailyGame.dailyWord == "" {
                    dailyGame.dailyWord = await dailyGame.getDailyWord()
                }
            }
        }
    }
}


