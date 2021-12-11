//
//  LocationDTO.swift
//  
//
//  Created by Felipe Izepe on 11/12/21.
//

import Foundation

struct LocationDTO: Decodable {

    var distance: Int
    var title: String
    var woeid: Int

    enum CodingKeys: String, CodingKey {
        case distance
        case title
        case woeid
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        distance = try container.decode(Int.self, forKey: .distance)
        title = try container.decode(String.self, forKey: .title)
        woeid = try container.decode(Int.self, forKey: .woeid)
    }
}
