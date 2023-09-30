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
        let homeRepository = HomeDetailsRepository(weatherService: homeService)
        let homeViewModel = HomeDetailsViewModel(homeRepository: homeRepository)
        
        return HomeDetailsView(viewModel: homeViewModel)
    }
}
