//
//  DetailView.swift
//  FriendFace
//
//  Created by enesozmus on 23.03.2024.
//

import SwiftUI

// → Here is where we will load more data about each user and use a navigation link to display the DetailView.
struct DetailView: View {
    
    let user: User
    
    var body: some View {
        List {
            Section {
                Text("Registered: \(user.formattedDate)")
                Text("Age: \(user.age)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("Works for: \(user.company)")
            } header: {
                Text("Basic Info")
            }
            
            Section {
                Text(user.about)
            } header: {
                Text("About")
            }
            
            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            } header: {
                Text("Friends")
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DetailView()
//}
