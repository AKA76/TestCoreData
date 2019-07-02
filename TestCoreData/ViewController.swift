//
//  ViewController.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let drink = DrinksList()
        let man = ManufacturersList()
        let lic = LicensesType()
        
        drink.fieldId = 1
        drink.drinkName = "Drink1"
        drink.manufacturer = 1
        man.fieldId = 1
        man.licenseType = 1
        man.name = "Man1"
        lic.fieldId = 1
        lic.type = "Type1"
        
//        drink.manufacturerName?.fieldId = 1
//        drink.manufacturerName?.licenseType = 1
//        drink.manufacturerName?.name = "Man1"
//        drink.manufacturerName?.licType?.fieldId = 1
//        drink.manufacturerName?.licType?.type = "Type1"
        CoreDataManager.instance.saveContext()
        
        var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "DrinksList", keyForSort: "drinkName")
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        let drinksList = fetchedResultsController.fetchedObjects as! [DrinksList]
        
        print("List1 Drinks: \(drinksList)")
        print("Field: \(drinksList[0].manufacturerName)")
        
        var fetchedResultsControllerM = CoreDataManager.instance.fetchedResultsController(entityName: "ManufacturersList", keyForSort: "fieldId")
        
        do {
            try fetchedResultsControllerM.performFetch()
        } catch {
            print(error)
        }
        
        let manList = fetchedResultsControllerM.fetchedObjects as! [ManufacturersList]
        
        print("List1 Man: \(manList)")
        print("Field: \(drinksList[0].manufacturerName)")
        
        var fetchedResultsControllerL = CoreDataManager.instance.fetchedResultsController(entityName: "LicensesType", keyForSort: "fieldId")
        
        do {
            try fetchedResultsControllerL.performFetch()
        } catch {
            print(error)
        }
        
        let licList = fetchedResultsControllerL.fetchedObjects as! [LicensesType]
        
        print("List1 Lic: \(licList)")
        print("Field: \(drinksList[0].manufacturerName)")
        

    }


}

