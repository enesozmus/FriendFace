//
//  DetailView.swift
//  FriendFace
//
//  Created by enesozmus on 23.03.2024.
//

import SwiftUI

// → Here is where we will load more data about each user and use a navigation link to display the DetailView.
struct DetailView: View {
    
    //let user: User
    let user: CachedUser
    
    var body: some View {
        List {
            Section {
                Text("Registered: \(user.wrappedFormattedDate)")
                Text("Age: \(user.age)")
                Text("Email: \(user.wrappedEmail)")
                Text("Address: \(user.wrappedAddress)")
                Text("Works for: \(user.wrappedCompany)")
            } header: {
                Text("Basic Info")
            }
            
            Section {
                Text(user.wrappedAbout)
            } header: {
                Text("About")
            }
            
            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("Friends")
            }
        }
        .navigationTitle("aaaaaa")
        .navigationBarTitleDisplayMode(.inline)
    }
}
