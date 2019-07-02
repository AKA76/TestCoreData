//
//  ManufacturersList+CoreDataProperties.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//
//

import Foundation
import CoreData


extension ManufacturersList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManufacturersList> {
        return NSFetchRequest<ManufacturersList>(entityName: "ManufacturersList")
    }

    @NSManaged public var fieldId: Int64
    @NSManaged public var name: String?
    @NSManaged public var licenseType: Int64
    @NSManaged public var drinksList: NSOrderedSet?
    @NSManaged public var licType: LicensesType?

}

// MARK: Generated accessors for drinksList
extension ManufacturersList {

    @objc(insertObject:inDrinksListAtIndex:)
    @NSManaged public func insertIntoDrinksList(_ value: DrinksList, at idx: Int)

    @objc(removeObjectFromDrinksListAtIndex:)
    @NSManaged public func removeFromDrinksList(at idx: Int)

    @objc(insertDrinksList:atIndexes:)
    @NSManaged public func insertIntoDrinksList(_ values: [DrinksList], at indexes: NSIndexSet)

    @objc(removeDrinksListAtIndexes:)
    @NSManaged public func removeFromDrinksList(at indexes: NSIndexSet)

    @objc(replaceObjectInDrinksListAtIndex:withObject:)
    @NSManaged public func replaceDrinksList(at idx: Int, with value: DrinksList)

    @objc(replaceDrinksListAtIndexes:withDrinksList:)
    @NSManaged public func replaceDrinksList(at indexes: NSIndexSet, with values: [DrinksList])

    @objc(addDrinksListObject:)
    @NSManaged public func addToDrinksList(_ value: DrinksList)

    @objc(removeDrinksListObject:)
    @NSManaged public func removeFromDrinksList(_ value: DrinksList)

    @objc(addDrinksList:)
    @NSManaged public func addToDrinksList(_ values: NSOrderedSet)

    @objc(removeDrinksList:)
    @NSManaged public func removeFromDrinksList(_ values: NSOrderedSet)

}
