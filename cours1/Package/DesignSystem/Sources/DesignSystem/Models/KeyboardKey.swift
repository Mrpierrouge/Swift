//
//  KeyboardKey.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 05/11/2025.
//

import SwiftUI

public enum KeyType {
    case letter(String)
    case enter
    case delete
}

public struct KeyboardKey: Identifiable {
    public let id = UUID()
    public let type: KeyType
    public var state: LetterResult = .empty
    public var color: Color {
        switch state {
        case .correct: return .green
        case .misplaced: return .yellow
        case .wrong: return .red
        case .empty: return .gray
        }
    }
}
