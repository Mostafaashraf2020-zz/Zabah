//
//  SendComplainModel.swift
//  Zbeha
//
//  Created by DP on 12/10/19.
//  Copyright © 2019 DP. All rights reserved.
//

import Foundation
struct SendComplainModel : Codable {
    let user : User?
    let stat : Int?
    let msg : String?
    
    enum CodingKeys: String, CodingKey {
        
        case user = "user"
        case stat = "stat"
        case msg = "msg"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        stat = try values.decodeIfPresent(Int.self, forKey: .stat)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
    }
    struct User : Codable {
        let username : String?
        let complains : String?
        let updated_at : String?
        let created_at : String?
        let id : Int?
        
        enum CodingKeys: String, CodingKey {
            
            case username = "username"
            case complains = "complains"
            case updated_at = "updated_at"
            case created_at = "created_at"
            case id = "id"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            username = try values.decodeIfPresent(String.self, forKey: .username)
            complains = try values.decodeIfPresent(String.self, forKey: .complains)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
        }
        
    }

    
}
