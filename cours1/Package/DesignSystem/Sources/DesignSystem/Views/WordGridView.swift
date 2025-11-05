//
//  WordGridView.swift
//  DesignSystem
//
//  Created by LETARD Pierric on 05/11/2025.
//
import SwiftUI

public struct WordGridView: View {
    public init(rows: [[LetterTile]]) {
        self.rows = rows
    }
    
    let rows: [[LetterTile]]
    
    public var body: some View {
        GeometryReader { geo in
            let horizontalPadding: CGFloat = 16
            let availableWidth = geo.size.width - (horizontalPadding * 2)
            
            let maxColumns = rows.map { $0.count }.max() ?? 5
            let spacing: CGFloat = 8
            let totalSpacing = spacing * CGFloat(maxColumns - 1)
            let tileSize = (geo.size.width - totalSpacing - 32) / CGFloat(maxColumns) // padding latéral de 16
            
            Grid(horizontalSpacing: spacing, verticalSpacing: spacing) {
                ForEach(rows.indices, id: \.self) { rowIndex in
                    WordRowView(tiles: rows[rowIndex], size: tileSize)
                }
            }
            .frame(width: availableWidth)
            .padding(.horizontal, horizontalPadding)
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
    }
}
