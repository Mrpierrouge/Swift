//
//  KeyboardView.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 05/11/2025.
//

import SwiftUI

public struct KeyboardView: View {
    public init(action: @escaping (KeyboardKey) -> Void) {
        self.action = action
    }
    let action: (KeyboardKey) -> Void
    
    private let rows: [[KeyboardKey]] = [
        "QWERTYUIOP".map { KeyboardKey(type: .letter(String($0))) },
        "ASDFGHJKL".map { KeyboardKey(type: .letter(String($0))) },
        [KeyboardKey(type: .enter)]
        + "ZXCVBNM".map { KeyboardKey(type: .letter(String($0))) }
        + [KeyboardKey(type: .delete)]
    ]
    
    public var body: some View {
        VStack(spacing: 8) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 6) {
                    ForEach(rows[rowIndex]) { key in
                        KeyboardKeyView(key: key, size: 38, action: action)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(UIColor.systemBackground))
    }
}
