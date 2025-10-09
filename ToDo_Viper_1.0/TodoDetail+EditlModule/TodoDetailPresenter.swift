//
//  TodoDetailPresenter.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI
import Combine

class TodoDetailPresenter: ObservableObject {
    
     let interactor: TodoDetailInteractor
     let router = TodoDetailRouter()
    
    @Published var todo: Todo
    
    init(interactor: TodoDetailInteractor) {
        self.interactor = interactor
        self.todo = interactor.todo
        
    }
    
    func showDate(_ date: Date) -> some View {
        HStack {
            // Todo time
            Text("\(date.formatted(date: .numeric, time: .omitted))")
                .font(Font.secondaryFont)
                .foregroundStyle(Color.white)
                .opacity(0.5)
                .padding(.leading, 5)
            Spacer()
        }
    }
    
    func showTodoNameEditor(_ text: Binding<String>) -> some View {
        TextEditor(text: text).lineLimit(1)
            .scrollContentBackground(.hidden)
            .font(Font.headerFont)
            .foregroundStyle(Color.white)
            .frame(width: UIScreen.main.bounds.width, height: 52)
    }
    
    func showTodoNotesEditor(_ text: Binding<String>) -> some View {
        TextEditor(text: text)
            .scrollContentBackground(.hidden)
            .font(Font.mainFont)
            .foregroundStyle(Color.white)
    }
}
