//
//  ReportViewModel.swift
//  FaireWeather
//
//  Created by Felipe Izepe on 11/12/21.
//

import Foundation
import WeatherServices
import DesignSystem

class ReportViewModel: ObservableObject {
    @Published private(set) var report: WeatherReport?
    @Published private(set) var error: Error?

    @Published private(set) var selectdPallet: CollorPallet = Resources.selectedPallet

    private let service: FindWeatherServiceProtocol
    private let locationId: Int

    var minValue: String {
        if let temp = report?.measurements.first?.minTemp {
            return "\(temp)º"
        } else {
            return "-"
        }
    }

    var maxValue: String {
        if let temp = report?.measurements.first?.maxTemp {
            return "\(temp)º"
        } else {
            return "-"
        }
    }

    var imageName: String {
        report?.measurements.first?.imageName ?? ""
    }

    init(locationId: Int,
         service: FindWeatherServiceProtocol = WeatherServiceFactory.shared.findWeatherService) {
        self.service = service
        self.locationId = locationId
    }

    func searchWeather() {
        print("Request")
        service.findWeather(locationId: locationId) { [weak self] result in
            switch result {
            case .success(let report):
                self?.report = report
            case.failure(let networkError):
                print(networkError)
                self?.error = networkError
            }
        }
    }
}
