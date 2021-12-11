//
//  SearchViewModel.swift
//  FaireWeather
//
//  Created by Felipe Izepe on 11/12/21.
//

import Foundation
import WeatherServices
import DesignSystem

class SearchViewModel: ObservableObject {
    @Published private(set) var locations: [Location] = []
    @Published private(set) var error: Error?

    @Published private(set) var selectdPallet: CollorPallet = Resources.pallets[0]

    private let service: FindWeatherServiceProtocol
    private var selectedPalletIndex: Int = 0

    var searchText: String {
        SearchTable.search.textValue()
    }

    var searchLocationText: String {
        SearchTable.searchLocation.textValue()
    }

    var searchWeatherText: String {
        SearchTable.searchWeather.textValue()
    }

    var lattitudeText: String {
        SearchTable.lattitude.textValue()
    }

    var longitudeText: String {
        SearchTable.longitude.textValue()
    }

    init(service: FindWeatherServiceProtocol = WeatherServiceFactory.shared.findWeatherService) {
        self.service = service
    }

    func searchLocation(lattitude latValue: String, longitude lonValue: String) {
        guard let lattitude: Double = Double(latValue) else {
            error = UIError(type: .invalidLattitude)
            return
        }

        guard let longitude: Double = Double(lonValue) else {
            error = UIError(type: .invalidLongitude)
            return
        }

        service.findLocationId(lattitude: lattitude, longitude: longitude) { [weak self] result in
            switch result {
            case .success(let locations):
                self?.locations = locations
            case.failure(let networkError):
                self?.error = networkError
            }
        }
    }

    func nextPallet() {
        selectedPalletIndex += 1
        if selectedPalletIndex >= Resources.pallets.count {
            selectedPalletIndex = 0
        }

        selectdPallet = Resources.pallets[selectedPalletIndex]
    }
}
