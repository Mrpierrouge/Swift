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
    @StateObject var viewModel = WordleGameViewModel()
    @State private var navigateToGame = false
    
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
                    viewModel.startNewGame(daily: false)
                    navigateToGame = true
                } label: {
                    Text("Nouvelle partie")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                }
                
                Spacer()
            }
            .navigationDestination(isPresented: $navigateToGame) {
                WordleGameView(gameModel: viewModel)
            }
            .task {
                if viewModel.words.isEmpty {
                    print("fetching 10 words")
                    viewModel.words = await viewModel.getWord(count: 10)
                }
            }
        }
    }
}


