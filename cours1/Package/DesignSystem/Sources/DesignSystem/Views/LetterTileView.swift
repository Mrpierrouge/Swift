//
//  LetterTileView.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 04/11/2025.
//
import SwiftUI

public struct LetterTileView: View {
    public init(letterTile: LetterTile, size: CGFloat = 50) {
        self.letterTile = letterTile
        self.size = size
    }
    let size: CGFloat
    let letterTile: LetterTile
    
    public var body: some View {
        Text(letterTile.letter ?? "")
            .frame(width: size, height: size)
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





