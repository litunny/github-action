//
//  CoreDataRepository].swift
//  GithubActionTest
//
//  Created by Itunu on 29/11/2021.
//

import Foundation
import CoreData

class StudentRepository : BaseRepository<Student> {
    
    func getStudents() -> [Student] {
        do {
            return try getAll().get()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}

class BaseRepository<T: NSManagedObject>  : Repository {
    
    private let managedObjectContext : NSManagedObjectContext
    
    typealias Entity = T
    
    init(managedObjectContext : NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func getAll(predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> Result<[T], Error> {
        let fetchRequest = Entity.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            if let results = try managedObjectContext.fetch(fetchRequest) as? [Entity] {
                return .success(results)
            } else {
                return .failure(CoreDataError.invalidManagedObjectType)
            }
            
            
        } catch let error {
            return .failure(error)
        }
    }
    
    func create() -> Result<T, Error> {
        let entityName = String(describing: Entity.self)
        guard let managedObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext) as? Entity else {
            return .failure(CoreDataError.invalidManagedObjectType)
        }
        return .success(managedObject)
    }
    
    func delete(entity: T) -> Result<Bool, Error> {
        managedObjectContext.delete(entity)
        return .success(true)
    }
    
}



enum CoreDataError : Error {
    case invalidManagedObjectType
}
