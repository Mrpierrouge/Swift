//
//  KeyboardKeyView.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 05/11/2025.
//

import SwiftUI

public struct KeyboardKeyView: View {
    let key: KeyboardKey
    let size: CGFloat
    let action: (KeyboardKey) -> Void
    
    public var body: some View {
        Button {
            action(key)
        } label: {
            Group {
                switch key.type {
                case .letter(let letter):
                    Text(letter.uppercased())
                case .enter:
                    Text("↵")
                case .delete:
                    Image(systemName: "delete.left")
                }
            }
            .frame(width: keyWidth, height: size)
            .background(color(for: key.state))
            .cornerRadius(6)
            .foregroundColor(.primary)
            .font(.system(size: 18, weight: .bold))
        }
    }
    
    var keyWidth: CGFloat {
        switch key.type {
        case .enter, .delete: return size * 1.5
        default: return size
        }
    }
    
    func color(for state: LetterResult?) -> Color {
        switch state {
        case .correct: return .green
        case .misplaced: return .yellow
        case .wrong: return .gray
        case .none: return .secondary.opacity(0.3)
        }
    }
}

