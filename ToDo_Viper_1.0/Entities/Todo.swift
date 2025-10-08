//
//  Todo.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation

struct Todo: Identifiable {
    let id: Int
    let todo: String
    let notes: String = ""
    let time: Date = Date.now
    let completed: Bool
    let userID: Int
}

extension Todo: Decodable {
    
    private enum CodingKeys: CodingKey {
        case id
        case todo
        case completed
        case userID
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawID = try? container.decode(Int.self, forKey: .id)
        let rawTodo = try? container.decode(String.self, forKey: .todo)
        let rawCompleted = try? container.decode(Bool.self, forKey: .completed)
        let rawUserID = try? container.decode(Int.self, forKey: .userID)
        
        guard let id = rawID,
              let todo = rawTodo,
              let completed = rawCompleted,
              let userID = rawUserID else { throw ErrorHandler.missingData }
        
        self.id = id
        self.todo = todo
        self.completed = completed
        self.userID = userID
                
    }
}

extension Todo: Equatable {
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        lhs.id == rhs.id
    }
}
