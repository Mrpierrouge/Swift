//
//  defaultGrid.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 05/11/2025.
//
import SwiftUI

@MainActor public let defautlGrid: [[LetterTile]] = [
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
