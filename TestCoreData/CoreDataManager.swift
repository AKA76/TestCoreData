//
//  CoreDataManager.swift
//  TestCoreData
//
//  Created by dev on 7/1/19.
//  Copyright © 2019 dev. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    // Singleton
    static let instance = CoreDataManager()
    
    private var appName = "TestCoreData"
    
    private init() {}
    
    // Entity for Name
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: persistentContainer.viewContext)!
    }
    
    // Fetched Results Controller for Entity Name
    func fetchedResultsController(entityName: String, keyForSort: String ) -> NSFetchedResultsController <NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: keyForSort, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }
    // Fetched Results Controller for Entity Name with Filter by column
    func fetchedResultsControllerWithFilter(entityName: String, keyForSort: String, predicateFormat: String?, columnName: String?, columnValue: String?) -> NSFetchedResultsController <NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        if let predicateFormat = predicateFormat, let columnName = columnName, let columnValue = columnValue {
            let predicate = NSPredicate(format: predicateFormat, columnName, columnValue)
            fetchRequest.predicate = predicate
        }
        let sortDescriptor = NSSortDescriptor(key: keyForSort, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }
    
    // MARK: - Core Data stack
    
    //    lazy var applicationDocumentsDirectory: NSURL = {
    //        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    //        return urls[urls.count-1] as NSURL
    //    }()
    //
    //    lazy var managedObjectModel: NSManagedObjectModel = {
    //        let modelURL = Bundle.main.url(forResource: appName, withExtension: "momd")!
    //        return NSManagedObjectModel(contentsOf: modelURL)!
    //    }()
    //
    //    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
    //        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
    //        let url = self.applicationDocumentsDirectory.appendingPathComponent("\(appName).sqlite")
    //        var failureReason = "There was an error creating or loading the application's saved data."
    //        do {
    //            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
    //        } catch {
    //            var dict = [String: AnyObject]()
    //            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
    //            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
    //            dict[NSUnderlyingErrorKey] = error as NSError
    //            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
    //            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
    //            abort()
    //        }
    //        return coordinator
    //    }()
    //
    //    lazy var managedObjectContext: NSManagedObjectContext = {
    //        let coordinator = self.persistentStoreCoordinator
    //        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    //        managedObjectContext.persistentStoreCoordinator = coordinator
    //        return managedObjectContext
    //    }()
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
