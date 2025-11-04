//
//  LetterTileView.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 04/11/2025.
//
import SwiftUI

public struct LetterTileView: View {
    public init(letterTile: LetterTile) {
        self.letterTile = letterTile
    }
    
    let letterTile: LetterTile

    public var body: some View {
        Text(letterTile.letter ?? "")
            .frame(width: 50, height: 50)
            .background(color(for: letterTile.result))
            .cornerRadius(8)
            .font(.title)
            .bold()
    }
    
    public func color(for result: LetterResult?) -> Color {
        switch result {
        case .correct: return .green
        case .misplaced: return .yellow
        case .wrong: return .gray
        case .none: return .secondary.opacity(0.3)
        }
    }

}

public struct WordRowView: View {
    public init(tiles: [LetterTile]) {
        self.tiles = tiles
    }

    let tiles: [LetterTile]

    public var body: some View {
        HStack(spacing: 8) {
            ForEach(tiles) { tile in
                LetterTileView(letterTile: tile)
            }
        }
    }
}

public struct GridView: View {
    public init(rows: [[LetterTile]]) {
        self.rows = rows
    }

    let rows: [[LetterTile]]

    public var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<rows.count, id: \.self) { rowIndex in
                WordRowView(tiles: rows[rowIndex])
            }
        }
    }
}

