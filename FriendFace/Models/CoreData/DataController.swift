//
//  DataController.swift
//  FriendFace
//
//  Created by enesozmus on 23.03.2024.
//

import Foundation
import CoreData

// → Define an observable class to encapsulate all Core Data-related functionality.
class DataController: ObservableObject {
    // → Pass the data model filename to the container’s initializer.
    let container = NSPersistentContainer(name: "FriendFace")
    
    init() {
        // → Load any persistent stores, which creates a store if none exists.
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading data \(error.localizedDescription)")
            }
        }
    }
}
