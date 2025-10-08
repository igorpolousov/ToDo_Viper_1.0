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
     let router: TodoDetailRouter
    
    @Published var todo: Todo
    
    init(interactor: TodoDetailInteractor, router: TodoDetailRouter) {
        self.interactor = interactor
        self.router = router
        
        todo = interactor.todo
    }
}
