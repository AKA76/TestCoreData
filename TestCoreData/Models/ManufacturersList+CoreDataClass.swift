//
//  ManufacturersList+CoreDataClass.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ManufacturersList)
public class ManufacturersList: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "ManufacturersList"),
                  insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }

}
