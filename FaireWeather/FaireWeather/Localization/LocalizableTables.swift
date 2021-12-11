//
//  LocalizableTables.swift
//  FaireWeather
//
//  Created by Felipe Izepe on 11/12/21.
//

import Foundation

enum SearchTable: String {
    case search
    case searchLocation
    case searchWeather
    case lattitude
    case longitude

    func textValue() -> String {
        let key = self.rawValue
        var result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)

        if result == key {
            result = Bundle.main.localizedString(forKey: key, value: nil, table: "Search")
        }

        return result
    }
}

enum ErrorsTable: String {
    case invalidValue
    case invalidLattitude
    case invalidLongitude
    case invalidId

    func textValue() -> String {
        let key = self.rawValue
        var result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)

        if result == key {
            result = Bundle.main.localizedString(forKey: key, value: nil, table: "Errors")
        }

        return result
    }
}
