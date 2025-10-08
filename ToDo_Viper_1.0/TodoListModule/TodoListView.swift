//
//  TodoListView.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var presenter: TodoListPresenter
    
    var body: some View {
        List {
            ForEach(presenter.isSearching ? presenter.filteredTodos : presenter.todos, id:\.id) { todo in
                ZStack {
                    presenter.linkBuilder(for: todo) {}
                        .buttonStyle(.plain)
                        .opacity(0.0)
                        .frame(height: 0)
                    
                    TodoListRowView(todo: todo)
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .buttonStyle(BorderlessButtonStyle())
        .navigationTitle("Todos")
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
        .toolbarBackground(.visible)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Spacer(minLength: 150)
                    
                    // Tasks counter bottom toolbar
                    presenter.makeBottomToolBarCounter()
                    
                    Spacer()
                    
                    // Creating new task button
                    presenter.makeAddNewButton()
                }
            }
        }
        // Style setup for bottom toolbar
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .bottomBar)
        .searchable(text: $presenter.searchText, placement: .automatic, prompt: Text("Search in todos"))

    }
}



#Preview {
    let provider = TodosProvider()
    let interactor = TodoListInteractor(provider: provider)
    let presenter = TodoListPresenter(interactor: interactor)
    TodoListView(presenter:presenter )
}
