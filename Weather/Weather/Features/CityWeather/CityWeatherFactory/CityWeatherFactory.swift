//
//  HomeFactory.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation
import SwiftUI

class CityWeatherFactory {
    static func createCityWeather(for city: String) -> some View {
        let homeService = CityWeatherService()
        let homeRepository = CityWeatherRepository(weatherService: homeService)
        let homeViewModel = CityWeatherViewModel(homeRepository: homeRepository)
        
        return CityWeatherView(viewModel: homeViewModel, city: city)
    }
}
