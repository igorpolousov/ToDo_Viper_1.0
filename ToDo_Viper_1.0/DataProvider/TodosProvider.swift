//
//  TodosProvider.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation
import Combine
import CoreData


class TodosProvider: ObservableObject {
    
    let coreDataStack = CoreDataStack(modelName: "ToDo_Viper_1.0")
    
    @Published var todos: [Todo] = []
    @Published var searchText: String = ""
    @Published var filteredTodos: [Todo] = []
    @Published var cdtodos = Set<CDTodoModel>()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        coreDataStack.managedContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        addSubscribers()
        readTodosFromCoreData()
    }
    
    // Create new todo with default todo, notes, data values
    func createTodo() {
        var newTodo = Todo(id: Int(idForNewTodo()), todo: "Add new todo name",completed: false, userId: 1034)
        newTodo.notes = "Add some notes"
        todos.insert(newTodo, at: 0)
        
        //coreDataStack.managedContext.automaticallyMergesChangesFromParent = true
        
        let backgroundContext = coreDataStack.storeContainer.newBackgroundContext()

        backgroundContext.perform {
            let newTodo = CDTodoModel(context: self.coreDataStack.managedContext)
            newTodo.id = Double(self.idForNewTodo())
            newTodo.todo = "Add new todo name"
            newTodo.completed =  false
            newTodo.userId = 1034
            newTodo.notes = "Add some notes"
            newTodo.time = Date.now
            self.coreDataStack.saveContext()
            self.readTodosFromCoreData()
        }
    }
    
    // Find id for new todo
    private func idForNewTodo() -> Double {
        guard !cdtodos.isEmpty else { return 1 }
        var id = 0.0
        for todo in cdtodos {
            if todo.id >= id {
                id = todo.id + 1
            }
        }
        return id
    }
    
    var isSeaching: Bool {
        !searchText.isEmpty
    }
    
    // Searchinig in tasks
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.filteredTodosSearch(searchText: searchText)
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
    
    func convertTodoToCDTodoModel(_ todo: Todo) -> CDTodoModel {
        let cdtodoModel = CDTodoModel(context: coreDataStack.managedContext)
        cdtodoModel.todo = todo.todo
        cdtodoModel.notes = todo.notes
        cdtodoModel.id = Double(todo.id)
        cdtodoModel.time = todo.time
        cdtodoModel.userId = Double(todo.userId)
        cdtodoModel.completed = todo.completed
        return cdtodoModel
    }
    
    func saveTodosToCoreData(_ todos: [Todo]) {
        var cdtModels: [CDTodoModel] = []
        for todo in todos {
            let cdtModel = convertTodoToCDTodoModel(todo)
            cdtModels.append(cdtModel)
        }
        coreDataStack.saveContext()
    }
    
    func readTodosFromCoreData() {
      
        
        let fetchRequest: NSFetchRequest<CDTodoModel> = CDTodoModel.fetchRequest()
        var asyncFetchRequest: NSAsynchronousFetchRequest<CDTodoModel>?
        asyncFetchRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest){ [weak self] (result: NSAsynchronousFetchResult) in
            guard let result = result.finalResult else { return }
            self?.cdtodos = Set(result)
//            for todo in self!.cdtodos {
//                self?.coreDataStack.managedContext.delete(todo)
//                self?.coreDataStack.saveContext()
//            }

            for todo in self!.cdtodos {
                print("\(todo.id) ")
            }
            print(self!.cdtodos.count)
        }
        
        do {
            guard let asyncFetchRequest = asyncFetchRequest else { return }
            try self .coreDataStack.managedContext.execute(asyncFetchRequest)
            
        } catch let error as NSError {
            print("Unable to laod data from Core Data store \(error.localizedDescription)")
        }
        
    }
    
}





