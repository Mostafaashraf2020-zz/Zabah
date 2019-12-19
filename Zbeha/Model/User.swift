//
//  User.swift
//  Zbeha
//
//  Created by Mostafa Ashraf on 12/13/19.
//  Copyright © 2019 DP. All rights reserved.
//

import Foundation
struct User : Codable {
    let id : Int?
    let name : String?
    let phone : String?
    let mail : String?
    let lat : String?
    let long : String?
    let password : String?
    let created_at : String?
    let updated_at : String?
    let token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case phone = "phone"
        case mail = "mail"
        case lat = "lat"
        case long = "long"
        case password = "password"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        mail = try values.decodeIfPresent(String.self, forKey: .mail)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        long = try values.decodeIfPresent(String.self, forKey: .long)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }
    
}
