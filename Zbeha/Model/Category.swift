//
//  Category.swift
//  Zbeha
//
//  Created by Mostafa Ashraf on 12/13/19.
//  Copyright © 2019 DP. All rights reserved.
//

import Foundation
struct Category : Codable {
    let user : User?
    let stat : Int?
    let msg : String?
    let product : [Product]?
    
    enum CodingKeys: String, CodingKey {
        
        case user = "user"
        case stat = "stat"
        case msg = "msg"
        case product = "product"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        stat = try values.decodeIfPresent(Int.self, forKey: .stat)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        product = try values.decodeIfPresent([Product].self, forKey: .product)
        
    }
    
}
