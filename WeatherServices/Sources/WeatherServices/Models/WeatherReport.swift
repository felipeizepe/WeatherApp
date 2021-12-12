//
//  WeatherReport.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation

public class WeatherReport: Identifiable {

    public private(set) var locationName: String
    public private(set) var locationType: String
    public private(set) var measurements: [WeatherMeasurement]

    init(weatherDTO: WeatherReportDTO) {
        self.locationName = weatherDTO.title
        self.locationType = weatherDTO.locationType

        self.measurements = weatherDTO.consolidatedWeather.map { WeatherMeasurement(measurementDTO: $0) }
    }
}

public class WeatherMeasurement: Identifiable {

    public private(set) var id: String
    public private(set) var state: WeatherType
    public private(set) var imageName: String
    public private(set) var minTemp: String
    public private(set) var maxTemp: String

    init(measurementDTO: WeatherMeasurementDTO) {
        self.id = "\(measurementDTO.id)"
        self.state = WeatherType(rawValue: measurementDTO.weatherStateName) ?? .clear
        self.minTemp = "\(measurementDTO.minTemp)"
        self.maxTemp = "\(measurementDTO.maxTemp)"
        self.imageName = measurementDTO.weatherStateAbbr
    }
}

public enum WeatherType: String {

    case snow = "Snow"
    case sleet = "Sleet"
    case hail = "Hail"
    case thunderstorm = "Thunderstorm"
    case heavyRain = "Heavy Rain"
    case lightRain = "Light Rain"
    case showers = "Showers"
    case heavyCloud = "Heavy Cloud"
    case lightCloud = "Light Cloud"
    case clear = "Clear"
}
