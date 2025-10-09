//
//  TodoListRouter.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI

class TodoListRouter {
    func makeDetailView(for todo: Todo, provider: TodosProvider) -> some View {
        let presenter = TodoDetailPresenter(interactor: TodoDetailInteractor(todo: todo, provider: provider))
        return TodoDetailView(presenter: presenter)
    }
}
