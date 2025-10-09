//
//  TodoDetailView.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI

struct TodoDetailView: View {
    
    @ObservedObject var presenter: TodoDetailPresenter
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack {
                    // Todo name editor
                    presenter.showTodoNameEditor($presenter.todo.todo)
                    Spacer()
                }
                presenter.showDate(presenter.todo.time)
                Spacer()
                // Todo notes editor
                presenter.showTodoNotesEditor($presenter.todo.notes)
            }
            .onDisappear {
                // update doto data
                
            }
        }
    }
}

#Preview {
    let todo = Todo(id: 10, todo: "Preview Todo", completed: false, userId: 1035)
    let provider = TodosProvider()
    let interactor = TodoDetailInteractor(todo: todo, provider: provider)
    let presenter = TodoDetailPresenter(interactor: interactor)
    TodoDetailView(presenter: presenter)
}
