//
//  ListTodoView.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//


import PhotosUI
import SwiftUI

struct ListTodoView: View {
    @StateObject var test = TodoViewModel()
    
    var body: some View {
        VStack(spacing: 16){
            List(test.allTodos){ todo in
                HStack(spacing: 10) {
                    NavigationLink(destination: DetailTodoView(todo: todo)) {
                        HStack {
                            Text(todo.title)
                                .font(.headline)
                            Spacer()
                            if todo.completed {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    
                }.padding(.vertical, 5)
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Liste des Todos")
            .task {
                await test.fetchMultipleTodos(x: 10)
            }
            
        }
    }
}