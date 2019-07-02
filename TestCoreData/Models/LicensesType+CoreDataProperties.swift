//
//  LicensesType+CoreDataProperties.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//
//

import Foundation
import CoreData


extension LicensesType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LicensesType> {
        return NSFetchRequest<LicensesType>(entityName: "LicensesType")
    }

    @NSManaged public var fieldId: Int64
    @NSManaged public var type: String?
    @NSManaged public var manufactureL: ManufacturersList?

}
