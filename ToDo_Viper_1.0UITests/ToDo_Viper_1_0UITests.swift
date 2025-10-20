//
//  ToDo_Viper_1_0UITests.swift
//  ToDo_Viper_1.0UITests
//
//  Created by Igor Polousov on 08.10.2025.
//

import XCTest

final class ToDo_Viper_1_0UITests: XCTestCase {
    
    //var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
       

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.activate()
        
        app/*@START_MENU_TOKEN@*/.buttons["newTask"]/*[[".otherElements.buttons[\"newTask\"]",".buttons",".buttons[\"newTask\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        XCTAssertTrue(app.buttons["newTask"].exists)
        
        
        app.otherElements/*@START_MENU_TOKEN@*/.containing(.collectionView, identifier: "TodosListTests").firstMatch/*[[".element(boundBy: 12)",".containing(.other, identifier: \"Vertical scroll bar, 1 page\").firstMatch",".containing(.collectionView, identifier: \"TodosListTests\").firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app/*@START_MENU_TOKEN@*/.collectionViews["TodosListTests"].firstMatch/*[[".otherElements.collectionViews[\"TodosListTests\"].firstMatch",".collectionViews",".containing(.other, identifier: nil).firstMatch",".containing(.other, identifier: \"Vertical scroll bar, 1 page\").firstMatch",".firstMatch",".collectionViews[\"TodosListTests\"].firstMatch"],[[[-1,5],[-1,1,1],[-1,0]],[[-1,4],[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        element.swipeUp()
        element.swipeDown()
        XCTAssertEqual(element.cells.count, 1)
        
        // Test elements sizes
        app/*@START_MENU_TOKEN@*/.buttons["circleGray"]/*[[".otherElements.buttons[\"circleGray\"]",".buttons[\"circleGray\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.images["tick"]/*[[".buttons.images[\"tick\"]",".images[\"tick\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.buttons["circleGray"]/*[[".otherElements.buttons[\"circleGray\"]",".buttons[\"circleGray\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.frame.width, 24)
        
        // Test font sizes
        
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.staticTexts["Add new todo name"]/*[[".otherElements.staticTexts[\"Add new todo name\"]",".staticTexts[\"Add new todo name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, "Add new todo name")
        XCTAssertEqual( app/*@START_MENU_TOKEN@*/.staticTexts["20.10.2025"]/*[[".otherElements.staticTexts[\"20.10.2025\"]",".staticTexts[\"20.10.2025\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, Date.now.formatted(date: .numeric, time: .omitted))
       
      
       
        
        
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
