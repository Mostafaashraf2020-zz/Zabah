

import Foundation
struct Home : Codable {
	let id : String?
	let img : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case img = "img"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		img = try values.decodeIfPresent(String.self, forKey: .img)
	}

}
