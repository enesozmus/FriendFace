//
//  User.swift
//  FriendFace
//
//  Created by enesozmus on 23.03.2024.
//

import Foundation

/*
    1. This is going to be our “User” data model where we will be creating a struct that will mimic our User object from json.
    2. That is why the User struct must conform to the “Codable” protocol.
    3. In this particular case it will conform to the “Identifiable” protocol too because it has an “id” property so we can use ForEach later in code to display all users in a list.
 */
struct User: Codable, Identifiable {
    // A universally unique value to identify types, interfaces, and other items.
    // init() -> Creates a UUID with RFC 4122 version 4 random bytes.
    let id: UUID
    
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    // → the “friends” property is an array of “Friend”, and to make the code compile we need another file
    let friends: [Friend]
    
    /*
     func formatted() -> String
        -> formatted() → Generates a locale-aware string representation of a date using the default date format style.
        -> formatted(date:time:) → Generates a locale-aware string representation of a date using specified date and time format styles.
     
            date →  The date format style to apply to the date.
                ... .complete, .omitted, .long, .numeric, .abbreviated
     
            time →  The time format style to apply to the date.
                ... .complete, .omitted, .shortened, .standard
     
            For example, to create a string with a full date and no time representation, set
                the Date.FormatStyle.DateStyle to "complete"
                and the Date.FormatStyle.TimeStyle to "omitted".
     */
    var formattedDate: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}


/*
 
    protocol Codable
 
        -> A type that can convert itself into and out of an external representation.
        -> When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols(Encodable and Decodable).
     
            -> Encodable → A type that can encode itself to an external representation.
            -> Decodable → A type that can decode itself from an external representation.
     
        
        -> Many programming tasks involve sending data over a network connection, saving data to disk, or submitting data to APIs and services.
        -> These tasks often require data to be encoded and decoded to and from an intermediate format while the data is being transferred.
        -> The Swift standard library defines a standardized approach to data encoding and decoding.
        -> You adopt this approach by implementing the Encodable and Decodable protocols on your custom types.
        -> Adopting these protocols lets implementations of the Encoder and Decoder protocols take your data and encode or decode it to and from an external representation such as JSON or property list.
        -> To support both encoding and decoding, declare conformance to Codable, which combines the Encodable and Decodable protocols.
        -> This process is known as making your types codable.
*/


/*
 
    protocol Codable
 
        -> The Identifiable protocol is used to provide a stable notion of identity to a class or value type.
             
         Identities can have any of the following characteristics:
             1. ✅ Guaranteed always unique, like UUIDs.
             2. Persistently unique per environment, like database record keys.
             3. Unique for the lifetime of a process, like global incrementing integers.
             4. Unique for the lifetime of an object, like object identifiers.
             5. Unique within the current collection, like collection indices.
 */
