//
//  DoughnutsViewModel.swift
//  InstructionLectures
//
//  Created by Leo Arnold on 8/22/23.
//

import Foundation

class DoughnutsViewModel: ObservableObject {
    
    @Published var doughnuts: [DoughnutEntity] = []
    
    @Published var currentDoughnut: DoughnutEntity? = nil
    
    init() {
        getDoughnuts()
    }
    
    // Create
    func createDoughnut() {
        let context = CoreDataManager.instance.context
        let newDoughnut = DoughnutEntity(context: context)
        
        newDoughnut.name = "Maple"
        newDoughnut.price = 1.98
        newDoughnut.hasSprinkles = true
        newDoughnut.id = UUID()
        CoreDataManager.instance.save()
        getDoughnuts()
    }
    
    // Retrieve (get)
    func getDoughnuts() {
        do {
            
            let fetchRequest = DoughnutEntity.fetchRequest()
            let context = CoreDataManager.instance.context
            
            doughnuts = try context.fetch(fetchRequest)
            print("NICE! Got doughnuts")
        } catch let error {
            print("Error getting doughnuts: \(error)")
        }
    }
    
    // Update (edit)
    func editDoughnuts() {
        
    }
    
    // Delete
    func deleteDoughnuts() {
        if let currentDoughnut {
            CoreDataManager.instance.context.delete(currentDoughnut)
            CoreDataManager.instance.save()
            getDoughnuts()
        }
        currentDoughnut = nil
    }
}
