

import Foundation
struct Json4Swift_Base : Codable {
	let countrys : [Countrys]?

	enum CodingKeys: String, CodingKey {

		case countrys = "countrys"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		countrys = try values.decodeIfPresent([Countrys].self, forKey: .countrys)
	}

}
