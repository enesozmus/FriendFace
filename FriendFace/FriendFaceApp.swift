//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by enesozmus on 23.03.2024.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    
    // → Create an observable instance of the DataController
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // → Inject the persistent container's managed object context into the environment.
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        .modelContainer(for: UserSD.self)
    }
}
