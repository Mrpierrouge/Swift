//
//  KeyboardKey.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 05/11/2025.
//

import SwiftUI

public struct KeyboardKey: Identifiable {
    public enum KeyType {
        case letter(String)
        case enter
        case delete
    }
    
    public let id = UUID()
    public let type: KeyType
    public var state: LetterResult? = nil
}
