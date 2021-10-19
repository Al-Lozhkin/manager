//
//  Person+CoreDataProperties.swift
//  FinanceManager3
//
//  Created by Alexandr on 06.03.2020.
//  Copyright © 2020 Alexandr Burtsev. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var lastname: String?

}
