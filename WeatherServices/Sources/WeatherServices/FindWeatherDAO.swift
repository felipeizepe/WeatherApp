//
//  FindWeatherService.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation
import RequestCommons

public protocol FindWeatherServiceProtocol {

    func findWeather(locationId: Int, completion: ((Result<WeatherReport, NetworkError>) -> Void)?)
    func findLocationId(lattitude: Double, longitude: Double, completion: ((Result<[Location], NetworkError>) -> Void)?)
}

class FindWeatherDAO: FindWeatherServiceProtocol {

    private let core: NetworkCoreProtocol
    private let baseUrl: String = "https://www.metaweather.com/api/location/"

    init(networkCore: NetworkCoreProtocol = NetworkCore()) {
        self.core = networkCore
    }

    public func findWeather(locationId: Int, completion: ((Result<WeatherReport, NetworkError>) -> Void)?) {
        let completeUrl = baseUrl + "\(locationId)/"
        guard let url = URL(string: completeUrl) else {
            let error: NetworkError = NetworkError(status: .incorrectPath, error: nil, data: nil)
            completion?(.failure(error))
            return
        }

        let request: NetworkRequest = NetworkRequest(url: url, method: .get)
        core.performRequest(request) { response in
            switch response {
            case .success(let data):
                guard let reportDTO: WeatherReportDTO = try? JSONDecoder().decode(WeatherReportDTO.self, from: data) else {
                    let error: NetworkError = NetworkError(status: .parseError, error: nil, data: data)
                    completion?(Result.failure(error))
                    return
                }
                let report: WeatherReport = WeatherReport(weatherDTO: reportDTO)
                completion?(.success(report))
            case .error(let responseStatus, let error, let data):
                let error: NetworkError = NetworkError(status: responseStatus, error: error, data: data)
                completion?(Result.failure(error))
            }
        }
    }

    public func findLocationId(lattitude: Double, longitude: Double, completion: ((Result<[Location], NetworkError>) -> Void)?) {
        let completeUrl = baseUrl + "search/?lattlong=\(lattitude),\(longitude)"
        guard let url = URL(string: completeUrl) else {
            let error: NetworkError = NetworkError(status: .incorrectPath, error: nil, data: nil)
            completion?(.failure(error))
            return
        }

        let request: NetworkRequest = NetworkRequest(url: url, method: .get)
        core.performRequest(request) { response in
            switch response {
            case .success(let data):
                guard let reportArrayDTO: [LocationDTO] = try? JSONDecoder().decode([LocationDTO].self, from: data) else {
                    let error: NetworkError = NetworkError(status: .parseError, error: nil, data: data)
                    completion?(Result.failure(error))
                    return
                }
                let locations: [Location] = reportArrayDTO.map { Location(locationDTO: $0) }
                completion?(.success(locations))
            case .error(let responseStatus, let error, let data):
                let error: NetworkError = NetworkError(status: responseStatus, error: error, data: data)
                completion?(Result.failure(error))
            }
        }
    }
}
