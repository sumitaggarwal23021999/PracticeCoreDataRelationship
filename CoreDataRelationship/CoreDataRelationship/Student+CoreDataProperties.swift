//
//  Student+CoreDataProperties.swift
//  CoreDataRelationship
//
//  Created by Mayank Sharma  on 06/10/22.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var phone: String?
    @NSManaged public var universities: College?

}

extension Student : Identifiable {

}
