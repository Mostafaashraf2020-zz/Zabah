

import Foundation
struct Slider : Codable {
	let id : Int?
	let img : String?
	let price : String?
	let text_of_img : String?
	let num_product : String?
	let created_at : String?
	let updated_at : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case img = "img"
		case price = "price"
		case text_of_img = "text_of_img"
		case num_product = "num_product"
		case created_at = "created_at"
		case updated_at = "updated_at"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		img = try values.decodeIfPresent(String.self, forKey: .img)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		text_of_img = try values.decodeIfPresent(String.self, forKey: .text_of_img)
		num_product = try values.decodeIfPresent(String.self, forKey: .num_product)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
	}

}
