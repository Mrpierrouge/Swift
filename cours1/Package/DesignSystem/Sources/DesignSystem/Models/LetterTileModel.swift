//
//  LetterTileModel.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 04/11/2025.
//

import SwiftUI

public enum LetterResult: String, Codable {
    case correct
    case misplaced
    case wrong
}

public struct LetterTile: Codable, Identifiable {
    public init(id: Int, letter: String?, result: LetterResult) {
        self.id = id
        self.letter = letter
        self.result = result
    }
    
    public let id: Int
    public let letter: String?
    public let result: LetterResult
}
