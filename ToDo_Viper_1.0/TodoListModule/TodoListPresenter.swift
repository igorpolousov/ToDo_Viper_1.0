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
    @Published var searchText: String = ""
    @Published var filteredTodos: [Todo] = []
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    
    init(interactor: TodoListInteractor) {
        self.interactor = interactor
        addSubscribers()
       
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
    
    
    func linkBuilder<Content: View>(for todo: Todo, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeDetailView(for: todo, provider: interactor.provider)) {content()}
    }
    
    func addNewTodo() {
        interactor.addNewTodo()
    }
    
    func showDetailView(for todo: Todo) -> some View {
        router.makeDetailView(for: todo, provider: interactor.provider)
    }
    
    
    
    // Searchinig in tasks
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink {[weak self] searchText in
                guard let self = self else {return}
               self.filteredTodosSearch(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
    private func filteredTodosSearch(searchText: String) {
        guard !searchText.isEmpty else {
            self.filteredTodos = []
            return
        }
        
        let filteredResult = self.todos.filter { todo in
            let search = searchText.lowercased()
            let todoNameContainsSearch = todo.todo.lowercased().contains(search)
            let todoNotesContainsSearch = todo.notes.lowercased().contains(search)
            return todoNameContainsSearch || todoNotesContainsSearch
        }
        
        self.filteredTodos = filteredResult
    }
}
