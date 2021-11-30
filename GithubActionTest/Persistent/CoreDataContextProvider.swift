//
//  CoreDataContextProvider.swift
//  GithubActionTest
//
//  Created by Itunu on 29/11/2021.
//

import CoreData

class CoreDataContextProvider {
    private var containerName : String = "GithubActionTest"
    private var persistentContainer : NSPersistentContainer
    typealias CoreDataErrorCallBack = (Error?) -> Void?
    
    var context : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext : NSManagedObjectContext {
        return newBackgroundContext()
    }
    
    static var shared : CoreDataContextProvider = {
        return CoreDataContextProvider()
    }()
    
    init(errorHandler : CoreDataErrorCallBack? = nil) {
        persistentContainer = NSPersistentContainer(name: containerName)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                errorHandler?(error)
            }
        }
    }
    
    func newBackgroundContext () -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
}
