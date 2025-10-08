//
//  TodoDetailInteractor.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation

class TodoDetailInteractor {
    let todo: Todo
    let provider: TodosProvider
    
    init(todo: Todo, provider: TodosProvider) {
        self.todo = todo
        self.provider = provider
    }
}
