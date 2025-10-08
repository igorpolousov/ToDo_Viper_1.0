//
//  ToDo_Viper_1_0Tests.swift
//  ToDo_Viper_1.0Tests
//
//  Created by Igor Polousov on 08.10.2025.
//

import XCTest
@testable import ToDo_Viper_1_0

final class ToDo_Viper_1_0Tests: XCTestCase {
    
    
    // Testing Todo and Todos decoding JSON
    func testingTodoDecodesJSON() throws {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(Todo.self, from: testTodoData)
        
        XCTAssertEqual(decoded.id, 1)
        XCTAssertEqual(decoded.completed, false)
        XCTAssertEqual(decoded.todo, "Do something nice for someone you care about")
        XCTAssertEqual(decoded.userId, 152)
    }
    
    func testingTodosDecodesJSON() throws {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(Todos.self, from: testTodosData)
        
        XCTAssertEqual(decoded.todos.count, 6)
    }
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
