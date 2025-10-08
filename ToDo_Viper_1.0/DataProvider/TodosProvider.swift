//
//  TodosProvider.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation
import Combine



class TodosProvider: ObservableObject {
    
    @Published var todos: [Todo] = []
    @Published var seatchText: String = ""
    @Published var filteredTodos: [Todo] = []
    
    // Create new todo with default todo, notes, data values
    func createTodo() {
        var newTodo = Todo(id: idForNewTodo(), todo: "Add new todo name",completed: false, userId: 1034)
        newTodo.notes = "Add some notes"
        todos.insert(newTodo, at: 0)
    }
    
    // Find id for new todo
    private func idForNewTodo() -> Int {
        guard !todos.isEmpty else { return 1 }
        var id = 0
        for todo in todos {
            if todo.id > id {
                id = todo.id + 1
            }
        }
        return id
    }
}



#if DEBUG
extension TodosProvider {
    static var mockTodoProvider: TodosProvider {
        let provider = TodosProvider()
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Todos.self, from: testTodosData)
            provider.todos = decoded.todos
        } catch let error {
            print("Unable to get mock data \(error)")
        }
        return provider
    }
}
#endif
