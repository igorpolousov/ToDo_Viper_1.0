//
//  TestCoreDataStack.swift
//  ToDo_Viper_1.0Tests
//
//  Created by Igor Polousov on 14.10.2025.
//

import Foundation
import CoreData

class TestCoreDataStack: CoreDataStack {
    override init(modelName: String) {
        super.init(modelName: modelName)
        
        let persistanceStoreDescription = NSPersistentStoreDescription()
        persistanceStoreDescription.type = NSInMemoryStoreType
        
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores { persistanceStoreDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error) \(error.userInfo)")
            }
        }
        storeContailner = container
    }
}
