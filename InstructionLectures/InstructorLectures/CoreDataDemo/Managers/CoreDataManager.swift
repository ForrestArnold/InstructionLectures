//
//  CoreDataManager.swift
//  InstructionLectures
//
//  Created by Leo Arnold on 8/22/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager() // Singleton
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    private init() {
        container = NSPersistentContainer(name: "DoughnutContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data \(error)")
            }
        }
        context = container.viewContext
        
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving Core Data: \(error.localizedDescription)")
        }
    }
}
