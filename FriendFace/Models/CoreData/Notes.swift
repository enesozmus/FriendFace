//
//  Notes.swift
//  FriendFace
//
//  Created by enesozmus on 23.03.2024.
//

import Foundation

/*
    Core Data
        -> You can use "Core Data" to save your application’s permanent data for offline use, to cache temporary data, and to add undo functionality to your app on a single device.
        -> To sync data across multiple devices in a single iCloud account, Core Data automatically mirrors your schema to a CloudKit container.
        -> Core Data abstracts the details of mapping your objects to a store, making it easy to save data from Swift and Objective-C without administering a database directly.
        -> Core Data’s undo manager tracks changes and can roll them back individually, in groups, or all at once, making it easy to add undo and redo support to your app.
 */


/*
    Creating a Core Data model(https://developer.apple.com/documentation/coredata/creating_a_core_data_model)
        -> Through Core Data’s "Data Model editor", you define your data’s types and relationships, and generate respective class definitions.
        -> The first step in working with "Core Data" is to create a data model file to define the structure of your app’s objects, including their object types, properties, and relationships.
 
        -> Choose File > New > File and select the iOS platform tab. Scroll down to the Core Data section, select Data Model, and click Next.
        -> Name your model file, select its group and targets, and click Create.
        -> Xcode adds an .xcdatamodeld file with the specified name to your project.
 */


/*
    Setting up a Core Data stack
        -> After you create a data model file as described in Creating a Core Data model, set up the classes that (manage and persist your app’s objects)collaboratively support your app’s model layer.
        -> These classes are collectively referred to as the Core Data stack.
 
            1. An instance of NSManagedObjectModel represents your app’s model file describing your app’s types, properties, and relationships.
            2. An instance of NSManagedObjectContext tracks changes to instances of your app’s types.
            3. An instance of NSPersistentStoreCoordinator saves and fetches instances of your app’s types from stores.
            4. An instance of NSPersistentContainer sets up the model, context, and store coordinator all at once.
 */


/*
    To use Core Data in this project, first we need to create a new Core Data Model so use Command + N and look for Core Data -> Data Model and name it “FriendFace”:
 
     0. Next, we need to create two entities: 1.CachedUser 2.CachedFriend
     1. To create an Entity, press “Add Entity”
     2. Rename Entities accordingly (CachedUser and CachedFriend) because we want to keep our structs “Friend” and “User”
     3. Add all the properties you intend to store in persistent storage with appropriate types
     4. Create relationship for both entities — the user will have a relationship called “friends” with a destination “CachedFriend” and inverse “user” which comes from the relationship on “CachedFriend” which is “user”, destination “CachedUser” and inverse “friends”
     5. “CachedUser” will have a type: “To Many” and “CachedFriend” will have a type: “To One”
     6. After that, select both entities and go to Editor->Create NSManagedObject Subclass…
     7. Click next a couple of times and make sure both entities are ticked and that you select your project folder when asked where to save the files.
     9. This should create 4 files for you.
     10. We needed this approach because we are going to create some computed properties to handle optionals and most importantly the NSSet of “friends” which we need to convert to Set so we can use it in SwiftUI
     11. Next, do Command + N and create a new empty Swift File and call it DataController.swift
 */


/*
    Initialize a Persistent Container
        -> DataController.swift
 */
