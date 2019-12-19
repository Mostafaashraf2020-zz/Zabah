

import Foundation
struct Product : Codable {
	let id : String?
	let img : String?
	let price : String?
	let text_of_img : String?
	let max_count : String?
	let category : String?
	let created_at : String?
	let updated_at : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case img = "img"
		case price = "price"
		case text_of_img = "text_of_img"
		case max_count = "max_count"
		case category = "category"
		case created_at = "created_at"
		case updated_at = "updated_at"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		img = try values.decodeIfPresent(String.self, forKey: .img)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		text_of_img = try values.decodeIfPresent(String.self, forKey: .text_of_img)
		max_count = try values.decodeIfPresent(String.self, forKey: .max_count)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
	}

}
