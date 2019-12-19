//
//  TermModel.swift
//  Zbeha
//
//  Created by DP on 12/4/19.
//  Copyright © 2019 DP. All rights reserved.
//

import Foundation
struct TermModel : Codable {
    let stat : Int?
    let msg : String?
    let terms_of_use : Terms_of_use?
    
    enum CodingKeys: String, CodingKey {
        
        case stat = "stat"
        case msg = "msg"
        case terms_of_use = "terms_of_use"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stat = try values.decodeIfPresent(Int.self, forKey: .stat)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        terms_of_use = try values.decodeIfPresent(Terms_of_use.self, forKey: .terms_of_use)
    }
    
}
struct Terms_of_use : Codable {
    let img : String?
    let text_1 : String?
    let text_2 : String?
    
    enum CodingKeys: String, CodingKey {
        
        case img = "img"
        case text_1 = "text_1"
        case text_2 = "text_2"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        img = try values.decodeIfPresent(String.self, forKey: .img)
        text_1 = try values.decodeIfPresent(String.self, forKey: .text_1)
        text_2 = try values.decodeIfPresent(String.self, forKey: .text_2)
    }
    
}

