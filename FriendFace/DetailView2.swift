//
//  DetailView2.swift
//  FriendFace
//
//  Created by enesozmus on 24.03.2024.
//

import SwiftUI

struct DetailView2: View {
    var user: UserSD
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Info") {
                    HStack {
                        Text("Age")
                            .bold()
                        Spacer()
                        Text("\(user.age)")
                    }
                    
                    HStack {
                        Text("Email")
                            .bold()
                        Spacer()
                        Text("\(user.email)")
                    }
                    
                    HStack {
                        Text("Date Joined")
                            .bold()
                        Spacer()
                        Text("\(user.fixedDate)")
                    }
                    
                    HStack {
                        Text("Address")
                            .bold()
                        Spacer()
                        Text("\(user.address)")
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Company")
                            .bold()
                        Spacer()
                        Text("\(user.company)")
                    }
                }
                
                Section ("Online Status") {
                    HStack {
                        Text(user.isActive ? "Online" : "Offline")
                            .bold()
                            .foregroundStyle(user.isActive ? .green : .red)
                    }
                }
                
                Section("Bio") {
                    Text(user.about)
                }
                
                Section("Friends") {
                    List(user.friends, id: \.id) { friend in
                        Text(friend.name)
                    }
                }
                
                Section("Tags") {
                    List(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
                
            }
            .navigationTitle(user.name)
        }
    }
}
