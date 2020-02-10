//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Tuomas Käyhty on 27/01/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import Foundation
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(by city: String = "Lappeenranta") {
        WeatherApi.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
