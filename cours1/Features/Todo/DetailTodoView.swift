//
//  DetailTodoView.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//


import PhotosUI
import SwiftUI

struct DetailTodoView: View {
    let todo: Todo
    
    var body: some View {
        VStack(spacing: 20) {
            Text(todo.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            HStack {
                Text("ID:")
                    .bold()
                Text("\(todo.id)")
            }
            
            HStack {
                Text("Completed:")
                    .bold()
                Text(todo.completed ? "Oui" : "Non")
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Détails Todo")
    }
    
}
