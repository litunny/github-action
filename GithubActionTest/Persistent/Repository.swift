//
//  Repository.swift
//  GithubActionTest
//
//  Created by Itunu on 29/11/2021.
//

import Foundation

protocol Repository {
    
    associatedtype Entity
    
    func getAll(predicate : NSPredicate?, sortDescriptors : [NSSortDescriptor]?) -> Result<[Entity], Error>
    
    func create() -> Result<Entity, Error>
    
    func delete(entity: Entity) -> Result<Bool, Error>
}
