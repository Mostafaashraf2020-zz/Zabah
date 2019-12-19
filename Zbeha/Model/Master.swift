

import Foundation
struct Master : Codable {
	let stat : Int?
	let msg : String?
	let slider : [Slider]?
	let home : [Home]?

	enum CodingKeys: String, CodingKey {

		case stat = "stat"
		case msg = "msg"
		case slider = "slider"
		case home = "home"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		stat = try values.decodeIfPresent(Int.self, forKey: .stat)
		msg = try values.decodeIfPresent(String.self, forKey: .msg)
		slider = try values.decodeIfPresent([Slider].self, forKey: .slider)
		home = try values.decodeIfPresent([Home].self, forKey: .home)
	}

}
