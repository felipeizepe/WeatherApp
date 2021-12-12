//
//  File.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation

struct WeatherReportDTO: Decodable {

    var title: String
    var locationType: String
    var consolidatedWeather: [WeatherMeasurementDTO]

    enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case consolidatedWeather = "consolidated_weather"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        consolidatedWeather = try container.decode([WeatherMeasurementDTO].self, forKey: .consolidatedWeather)
        title = try container.decode(String.self, forKey: .title)
        locationType = try container.decode(String.self, forKey: .locationType)
    }
}

struct WeatherMeasurementDTO: Decodable {

    var id: Int
    var weatherStateName: String
    var weatherStateAbbr: String
    var minTemp: Double
    var maxTemp: Double

    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case weatherStateAbbr = "weather_state_abbr"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        weatherStateName = try container.decode(String.self, forKey: .weatherStateName)
        minTemp = try container.decode(Double.self, forKey: .minTemp)
        maxTemp = try container.decode(Double.self, forKey: .maxTemp)
        weatherStateAbbr = try container.decode(String.self, forKey: .weatherStateAbbr)
    }
}


