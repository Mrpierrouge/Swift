//
//  model.swift
//  cours1
//
//  Created by LETARD Pierric on 04/11/2025.
//
import SwiftUI
import DesignSystem

struct MotRandom: Codable, Identifiable {
    let id = UUID()
    let name: String
    let categorie: String
}

struct Game {
    let targetWord: String
    var grid: [[LetterTile]]
    var currentRowIndex: Int = 0
    
    var currentAttempt: WordAttempt {
        WordAttempt(tiles: grid[currentRowIndex])
    }
    
    /// Indique si toutes les lignes ont été utilisées
    var isOver: Bool {
        currentRowIndex >= grid.count
    }
}

struct WordAttempt {
    var tiles: [LetterTile]
    
    /// Le mot actuel saisi par le joueur
    var currentWord: String {
        tiles.compactMap { $0.letter }.joined()
    }
    
    /// Indique si la ligne est complète
    var isComplete: Bool {
        tiles.allSatisfy { $0.letter != nil }
    }
    
    /// Renvoie l’index de la première case vide
    var firstEmptyIndex: Int? {
        tiles.firstIndex(where: { $0.letter == nil })
    }
}
