//
//  DrinksList+CoreDataProperties.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//
//

import Foundation
import CoreData


extension DrinksList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DrinksList> {
        return NSFetchRequest<DrinksList>(entityName: "DrinksList")
    }

    @NSManaged public var fieldId: Int64
    @NSManaged public var drinkName: String?
    @NSManaged public var type: Int64
    @NSManaged public var manufacturer: Int64
    @NSManaged public var manufacturerName: ManufacturersList?

}
