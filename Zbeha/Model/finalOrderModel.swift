//
//  finalOrderModel.swift
//  Zbeha
//
//  Created by DP on 12/3/19.
//  Copyright © 2019 DP. All rights reserved.
//

import Foundation

struct finalOrderModel : Codable {
    let stat : Int?
    let msg : String?
    
    enum CodingKeys: String, CodingKey {
        
        case stat = "stat"
        case msg = "msg"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stat = try values.decodeIfPresent(Int.self, forKey: .stat)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
    }
    
}
