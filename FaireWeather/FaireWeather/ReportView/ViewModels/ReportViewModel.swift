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

    init(locationId: Int,
         service: FindWeatherServiceProtocol = WeatherServiceFactory.shared.findWeatherService) {
        self.service = service
        self.locationId = locationId
    }

    func searchWeather() {
        service.findWeather(locationId: locationId) { [weak self] result in
            switch result {
            case .success(let report):
                self?.report = report
            case.failure(let networkError):
                self?.error = networkError
            }
        }
    }
}
