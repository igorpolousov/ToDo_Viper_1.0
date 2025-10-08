//
//  TodoListPresenter.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI
import Combine

class TodoListPresenter: ObservableObject {
    
    private let interactor: TodoListInteractor
    private let router: TodoListRouter = TodoListRouter()
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var todos: [Todo] = []
    
    init(interactor: TodoListInteractor) {
        self.interactor = interactor
        
        interactor.provider.$todos
            .assign(to: \.todos, on: self)
            .store(in: &cancellables)
    }
    
    func makeAddNewButton() -> some View {
        Button {
            self.addNewTodo()
        } label: {
            Image("newTask")
        }
    }
    
    func makeBottomToolBarCounter() -> some View {
        Text("\(self.todos.count) Todos")
            .foregroundStyle(Color.accentColor)
    }
    
    func addNewTodo() {
        interactor.addNewTodo()
    }
    
    func linkBuilder<Content: View>(for todo: Todo, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(for: todo, provider: interactor.provider)) {content()}
    }
}
