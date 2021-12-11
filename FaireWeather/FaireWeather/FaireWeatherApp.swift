//
//  FaireWeatherApp.swift
//  FaireWeather
//
//  Created by Felipe Izepe on 10/12/21.
//

import SwiftUI

@main
struct FaireWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel())
        }
    }
}
