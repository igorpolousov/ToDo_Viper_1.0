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
        var newTodo = Todo(id: 10, todo: "Add new todo name",completed: false, userId: 1034)
        newTodo.notes = "Add some notes"
        todos.insert(newTodo, at: 0)
    }
    
}
