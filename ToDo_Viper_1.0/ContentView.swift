//
//  ContentView.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var provider: TodosProvider
    
    var body: some View {
        NavigationView {
            TodoListView(presenter: TodoListPresenter(interactor: TodoListInteractor(provider: provider)))
        }
    }
}

#Preview {
    ContentView()
}
