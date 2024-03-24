//
//  FriendSD.swift
//  FriendFace
//
//  Created by enesozmus on 24.03.2024.
//

import Foundation
import SwiftData

@Model
class FriendSD: Codable {
    enum CodingKeys: CodingKey {
        case id, name
    }
    
    var id: UUID
    var name: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id            = try container.decode(UUID.self, forKey: .id)
        name          = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id,   forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
