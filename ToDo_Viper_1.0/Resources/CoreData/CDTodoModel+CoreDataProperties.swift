//
//  CDTodoModel+CoreDataProperties.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 09.10.2025.
//
//

public import Foundation
public import CoreData


public typealias CDTodoModelCoreDataPropertiesSet = NSSet

extension CDTodoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTodoModel> {
        return NSFetchRequest<CDTodoModel>(entityName: "CDTodoModel")
    }

    @NSManaged public var id: Double
    @NSManaged public var todo: String?
    @NSManaged public var notes: String?
    @NSManaged public var completed: Bool
    @NSManaged public var userId: Double
    @NSManaged public var time: Date?

}

extension CDTodoModel : Identifiable {

}
