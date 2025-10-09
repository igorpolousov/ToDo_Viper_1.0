//
//  CoreDataStack.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 09.10.2025.
//

import CoreData
import Combine

class CoreDataStack: ObservableObject {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContailner: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print("Error to load stores \(error) \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContailner.viewContext
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unable to save context \(error.localizedDescription)")
        }
    }
    
}
