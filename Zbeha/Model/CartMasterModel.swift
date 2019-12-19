	//
//  CartMasterModel.swift
//  Zbeha
//
//  Created by Mostafa Ashraf on 12/2/19.
//  Copyright © 2019 DP. All rights reserved.
//

import Foundation
    struct CartMasterModel : Codable {
        let stat : Int?
        let msg : String?
        var order : [Order]?
        
        enum CodingKeys: String, CodingKey {
            
            case stat = "stat"
            case msg = "msg"
            case order = "Order"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            stat = try values.decodeIfPresent(Int.self, forKey: .stat)
            msg = try values.decodeIfPresent(String.self, forKey: .msg)
            order = try values.decodeIfPresent([Order].self, forKey: .order)
        }
        
    }
