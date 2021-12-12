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
    @Published private(set) var errorMessage: String?

    @Published private(set) var selectdPallet: CollorPallet = Resources.selectedPallet

    private let service: FindWeatherServiceProtocol
    private var selectedPalletIndex: Int = 0

    private(set) var isLoading: Bool = false

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
        self.locations = []
        guard let lattitude: Double = Double(latValue) else {
            errorMessage = UIError(type: .invalidLattitude).message
            return
        }

        guard let longitude: Double = Double(lonValue) else {
            errorMessage = UIError(type: .invalidLongitude).message
            return
        }
        isLoading = true
        self.errorMessage = nil
        service.findLocationId(lattitude: lattitude, longitude: longitude) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let locations):
                self?.locations = locations
            case.failure(let networkError):
                self?.errorMessage = networkError.localizedDescription
            }
        }
    }

    func nextPallet() {
        selectedPalletIndex += 1
        if selectedPalletIndex >= Resources.pallets.count {
            selectedPalletIndex = 0
        }
        let pallet: CollorPallet = Resources.pallets[selectedPalletIndex]
        Resources.selectedPallet = pallet
        selectdPallet = pallet
    }
}
