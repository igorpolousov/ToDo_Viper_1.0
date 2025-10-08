//
//  Todos.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation

// Getting all todos from JSON
struct Todos: Decodable {
    private(set) var todos: [Todo]
}
