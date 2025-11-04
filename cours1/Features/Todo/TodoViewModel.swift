//
//  TodoViewModel.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//

import PhotosUI
import SwiftUI

@Observable
class TodoViewModel: ObservableObject {
    var baseURL: String = "https://jsonplaceholder.typicode.com/todos/"
    var allTodos: Array<Todo> = []
    
    func fetchTodo(id: Int) async -> Todo? {
        guard let url = URL(string: baseURL + String(id)) else {
            return nil
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return nil
            }
            let decoded = try JSONDecoder().decode(Todo.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }
    func fetchMultipleTodos(x: Int) async{
        allTodos.removeAll()
        for i in 1..<x {
            if let todo = await fetchTodo(id: i) {
                allTodos.append(todo)
            }
        }
    }
}
