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
    public private(set) var state: String
    public private(set) var minTemp: String
    public private(set) var maxTemp: String

    init(measurementDTO: WeatherMeasurementDTO) {
        self.id = "\(measurementDTO.id)"
        self.state = measurementDTO.weatherStateName
        self.minTemp = measurementDTO.minTemp
        self.maxTemp = measurementDTO.maxTemp
    }
}
