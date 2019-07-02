//
//  LicensesType+CoreDataClass.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//
//

import Foundation
import CoreData

@objc(LicensesType)
public class LicensesType: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "LicensesType"),
                  insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
}
