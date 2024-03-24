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
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    var body: some View {
        VStack {
            
            Text(user.nameInitials ?? "XX")
                .font(.largeTitle)
                .padding(60)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(user.isActive ? Color.green : Color.gray, lineWidth: 4)
                )
                .padding(20)
            
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
                
                // ...
                Section() {
                    ForEach(user.friendsArray, id: \.self) { friend in
                        if let friendFound = getFriendUserWithID(friend.wrappedID) {
                            NavigationLink {
                                DetailView(user: friendFound)
                            } label: {
                                Text(friendFound.wrappedName)
                            }
                        }
                    }
                } header: {
                    Text("Friends")
                }
            }
            
        }
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // ...
    func getFriendUserWithID(_ userID: UUID) -> CachedUser? {
        return cachedUsers.first { $0.id == userID }
    }
}
