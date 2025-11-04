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
    let grid: [[LetterTile]]
}
