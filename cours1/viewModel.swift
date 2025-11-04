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

struct ContentViewTest: View {
    @StateObject var test = WordleViewModel()
    let sampleGrid: [[LetterTile]] = [
        [
            LetterTile(id: 0, letter: "S", result: .correct),
            LetterTile(id: 1, letter: "W", result: .wrong),
            LetterTile(id: 2, letter: "I", result: .misplaced),
            LetterTile(id: 3, letter: "F", result: .wrong),
            LetterTile(id: 4, letter: "T", result: .correct)
        ],
        [
            LetterTile(id: 5, letter: "A", result: .wrong),
            LetterTile(id: 6, letter: "P", result: .wrong),
            LetterTile(id: 7, letter: "P", result: .wrong),
            LetterTile(id: 8, letter: "L", result: .misplaced),
            LetterTile(id: 9, letter: "E", result: .correct)
        ]
    ]

    var body: some View {
        VStack{
            GridView(rows: test.currentGame?.grid ?? sampleGrid)
                .padding()
            Button("new game") {
                test.startNewGame()
            }
        }.task {
            test.words = await test.getWord(count: 10)
        }

    }
}
#Preview {
    ContentViewTest()
}

