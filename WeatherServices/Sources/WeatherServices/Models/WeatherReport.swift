//
//  WeatherReport.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation

public class WeatherReport {

    public private(set) var id: String
    public private(set) var state: String

    init(weatherDTO: WeatherReportDTO) {
        self.id = "\(weatherDTO.id)"
        self.state = weatherDTO.weatherStateName
    }
}
