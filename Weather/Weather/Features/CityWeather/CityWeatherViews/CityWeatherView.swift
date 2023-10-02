//
//  HomeView.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import SwiftUI

struct CityWeatherView: View {
    @ObservedObject var viewModel: CityWeatherViewModel
    let city: String
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                if viewModel.loading {
                    ProgressView()
                } else {
                    HStack {
                        VStack {
                            Text(city)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(viewModel.temperature)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(viewModel.feelsLike)
                                .font(.title2)
                                .fontWeight(.bold)
                            HStack {
                                Text("Max: \(viewModel.maxTemp)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("Min: \(viewModel.minTemp)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .onAppear{ viewModel.fetchWeather(for: city) }
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherFactory.createCityWeather(for: "London")
    }
}
