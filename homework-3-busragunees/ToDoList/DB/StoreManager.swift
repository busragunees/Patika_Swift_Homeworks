//
//  StoreManager.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import Foundation
import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext
    
    private init() {
        context = persistentContainer.viewContext
    }
}

//MARK: - Brings all data from ToDoList DB.

extension StorageManager {
    
    func fetchData(completion: (Result<[ToDoEntity], Error>) -> Void)  {
        let fetchRequest = ToDoEntity.fetchRequest()
        
        do {
            let todoList = try context.fetch(fetchRequest)
            completion(.success(todoList))
        } catch {
            completion(.failure(error))
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addToDo(_ note: String,isCompleted:Bool, completion: (ToDoEntity) -> Void) {
        let todo = ToDoEntity(context: context)
        todo.note = note
        todo.isCompleted = isCompleted
        todo.createdDate = Date()
        todo.id = UUID()
        print("add ToDo -> ",todo.id)
        print("add ToDo -> ",todo.note)
        print("add ToDo -> ",todo.isCompleted)
        saveContext()
        completion(todo)
    }
    
    func deleteToDo(todo: ToDoEntity) {
        context.delete(todo)
        saveContext()
    }
    
    func editToDo(todo: ToDoEntity,note:String,isCompleted:Bool, completion: () -> Void) {
        todo.note = note
        todo.createdDate = Date()
        todo.isCompleted = isCompleted
        saveContext()
        completion()
        
    }
    
}

