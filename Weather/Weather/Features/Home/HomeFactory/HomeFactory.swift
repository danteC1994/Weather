//
//  HomeFactory.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation
import SwiftUI

class HomeFactory {
    static func createHome() -> some View {
        let homeService = HomeWeatherService()
        let homeRepository = HomeRepository(weatherService: homeService)
        let homeViewModel = HomeViewModel(homeRepository: homeRepository)
        
        return HomeView(viewModel: homeViewModel)
    }
}
