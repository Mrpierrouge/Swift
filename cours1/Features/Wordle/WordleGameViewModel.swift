//
//  WordleViewModel.swift
//  cours1
//
//  Created by LETARD Pierric on 04/11/2025.
//

import SwiftUI
import DesignSystem


@Observable
class WordleGameViewModel: ObservableObject {
    var baseURL: String = "https://trouve-mot.fr/api/random"
    var words: Array<MotRandom> = []
    var currentGame: Game? = nil
    var dailyWord: String = ""
    
    func getWord(count: Int = 1) async -> Array<MotRandom> {
        words.removeAll()
        guard let url = URL(string: baseURL + "/" + String(count)) else {
            return []
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return []
            }
            let decoded = try JSONDecoder().decode([MotRandom].self, from: data)
            return decoded
        } catch {
            print(error)
            return []
        }
    }
    func startNewGame(daily: Bool = false) {
        var word = dailyWord
        if !daily {
            guard let first = words.first else { return }
            word = first.name.uppercased()
        }
        
        // Crée une grille vide : par ex. 6 tentatives possibles
        let emptyRow = (0..<word.count).map { i in
            LetterTile(id: i, letter: nil, result: .wrong)
        }
        let grid = Array(repeating: emptyRow, count: 6)
        
        currentGame = Game(targetWord: word, grid: grid)
        print("Nouveau mot mystère :", word)
    }
    func getDailyWord() async -> String? {
        guard let url = URL(string: "https://trouve-mot.fr/api/daily") else {
            return ""
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return ""
            }
            let decoded = try JSONDecoder().decode(MotRandom.self, from: data)
            return decoded.name
        } catch {
            print(error)
            return ""
        }
    }
}
