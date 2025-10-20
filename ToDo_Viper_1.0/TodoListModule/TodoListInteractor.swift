//
//  TodoListInteractor.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation

class TodoListInteractor {
    
    let provider: TodosProvider
    
    init(provider: TodosProvider) {
        self.provider = provider
    }
    
    func addNewTodo() {
        provider.createTodo()
    }
    
    func deleteTodo(with id:Todo.ID) {
        provider.deleteTodo(with: id)
    }
    
}
