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
    
    @State private var navigationDestination: GameDestination? = nil
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
                    
                    dailyGame.startNewGame(daily: true)
                    navigationDestination = .daily
                } label: {
                    Text("dailyGameButton")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                }
                
                Button {
                    wordleGame.startNewGame(daily: false)
                    
                    navigationDestination = .normal
                } label: {
                    Text("playButton")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                }
                
            }
            
            .navigationDestination(item: $navigationDestination) { destination in
                switch destination {
                case .daily:
                    WordleGameView(gameModel: dailyGame)
                case .normal:
                    WordleGameView(gameModel: wordleGame)
                }
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


