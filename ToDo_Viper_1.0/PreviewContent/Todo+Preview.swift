//
//  Todo+Preview.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation

extension Todo {
    static var previewTodo: Todo {
        let todo = Todo(id: 10, todo: "Preview Todo", completed: false, userId: 1035)
        return todo
    }
}
