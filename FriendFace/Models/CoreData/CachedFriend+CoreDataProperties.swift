//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by enesozmus on 24.03.2024.
//
//

import Foundation
import CoreData


extension CachedFriend {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedID: UUID {
        id ?? UUID()
    }
    
}

extension CachedFriend : Identifiable {
    
}
