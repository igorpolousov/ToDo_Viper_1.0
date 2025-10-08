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
        Text("\(presenter.todo.todo)")
    }
}
