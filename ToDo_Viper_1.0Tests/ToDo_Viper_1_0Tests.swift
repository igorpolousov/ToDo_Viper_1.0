//
//  ToDo_Viper_1_0Tests.swift
//  ToDo_Viper_1.0Tests
//
//  Created by Igor Polousov on 08.10.2025.
//

import XCTest
@testable import ToDo_Viper_1_0
import CoreData

final class ToDo_Viper_1_0Tests: XCTestCase {
    
    //MARK: Properties
    var provider: TodosProvider!
    //var coreDataStack: CoreDataStack!
    var decoder: JSONDecoder!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //coreDataStack = TestCoreDataStack(modelName: "Test model")
        provider = TodosProvider()
        decoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //coreDataStack = nil
        provider = nil
        decoder = nil
    }
    
    
    // MARK: TodosProvider tests
    
    // Testing Todo and Todos decoding JSON
    func testingTodoDecodesJSON() throws {
        let decoded = try decoder.decode(Todo.self, from: testTodoData)
        
        XCTAssertEqual(decoded.id, 1)
        XCTAssertEqual(decoded.completed, false)
        XCTAssertEqual(decoded.todo, "Do something nice for someone you care about")
        XCTAssertEqual(decoded.userId, 152)
      
    }
    
    func testingTodosDecodesJSON() throws {
        let decoded = try decoder.decode(Todos.self, from: testTodosData)
        
        XCTAssertEqual(decoded.todos.count, 6)
    
    }
    
    // Testing TodosProvider creates new todo with default values and add it to todos Array
    func testingTodosProviderCreatesNewTodo() throws {
        provider.createTodo()
        let todo = provider.todos[0]
        
        XCTAssertEqual(provider.todos.count, 1)
        XCTAssertEqual(todo.id, 1)
        XCTAssertEqual(todo.completed, false)
        XCTAssertEqual(todo.todo, "Add new todo name")
        XCTAssertEqual(todo.notes, "Add some notes")
        XCTAssertEqual(todo.userId, 1034)
        
    }
    
    // Testing TodosProvider func idForNewTodo
    func testingTodosProviderCreatesIdForNewTodo() throws {
        provider.createTodo()
        provider.createTodo()
        
        XCTAssertEqual(provider.todos[0].id, 2)
   
    }
    
    // Testing convert Todo to CDTodoModel
    func testTodosProviderConvertsTodoToCDTodoModel() throws {
        let todo = try decoder.decode(Todo.self, from: testTodoData)
        let cdtodoModel = provider.convertTodoToCDTodoModel(todo)
        
        XCTAssertEqual(cdtodoModel.completed, false)
        XCTAssertEqual(cdtodoModel.id, 1)
        XCTAssertEqual(cdtodoModel.notes, "")
        XCTAssertEqual(cdtodoModel.todo, "Do something nice for someone you care about")
        XCTAssertEqual(cdtodoModel.userId, 152)
    }
    
    
    func testTodosProviderSavesContext() throws {
        let decoded = try decoder.decode(Todos.self, from: testTodosData)
        let todos = decoded.todos
        provider.saveTodosToCoreData(todos)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
