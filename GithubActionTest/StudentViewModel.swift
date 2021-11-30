//
//  StudentViewModel.swift
//  GithubActionTest
//
//  Created by Itunu on 29/11/2021.
//

import CoreData
import UIKit

class StudentViewModel : ObservableObject {
    
    private let context : NSManagedObjectContext
    private let repository : BaseRepository<Student>
    private let studentRepository : StudentRepository
    @Published var students : [Student] = []
    
    init() {
        
        context = CoreDataContextProvider.shared.context
        repository = BaseRepository<Student>(managedObjectContext: context)
        studentRepository = StudentRepository(managedObjectContext: context)
    }
    
    func save() {
        do {
            try context.save()
            fetchStudents()
        } catch let error {
            print("Error saving record \(error.localizedDescription)")
        }
    }
    
    func saveStudent(name : String) {
        let result = repository.create()
        
        switch result {
            case .success(let student):
                student.name = name
                save()
            break
            
            case .failure(let error):
                print("Error saving record \(error)")
            break
        }
    }
    
    func fetchStudents () {
        self.students = studentRepository.getStudents()
//        let result = repository.getAll()
//
//        switch result {
//            case .success(let students):
//                self.students = students
//            break
//
//            case .failure(let error):
//                print("Unable to retrieve records : \(error)")
//            break
//        }
    }
}


