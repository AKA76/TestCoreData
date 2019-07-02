//
//  DrinksList+CoreDataClass.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DrinksList)
public class DrinksList: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "DrinksList"),
                  insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }

}
