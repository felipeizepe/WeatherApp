//
//  File.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation

struct WeatherReportArrayDTO: Decodable {

    var consolidatedWeather: [WeatherReportDTO]

    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        consolidatedWeather = try container.decode([WeatherReportDTO].self, forKey: .consolidatedWeather)
    }
}

struct WeatherReportDTO: Decodable {

    var id: Int
    var weatherStateName: String

    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        weatherStateName = try container.decode(String.self, forKey: .weatherStateName)
    }
}


