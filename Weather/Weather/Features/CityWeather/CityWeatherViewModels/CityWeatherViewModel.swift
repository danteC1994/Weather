//
//  HomeViewModel.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation
import Combine

class CityWeatherViewModel: ObservableObject {
    @Published var temperature = ""
    @Published var maxTemp = ""
    @Published var minTemp = ""
    @Published var feelsLike = ""
    @Published var loading = true
    private var anyCancellable = Set<AnyCancellable>()

    private let homeRepository: CityWeatherRepository

    init(homeRepository: CityWeatherRepository) {
        self.homeRepository = homeRepository
        setUpBindings()
    }

    func setUpBindings() {
        homeRepository.cityWeatherPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    break
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] weather in
                self?.loading = false
                self?.temperature = weather.main?.temp?.toCelsius() ?? ""
                self?.maxTemp = weather.main?.tempMax?.toCelsius() ?? ""
                self?.minTemp = weather.main?.tempMin?.toCelsius() ?? ""
                self?.feelsLike = weather.main?.feelsLike?.toCelsius() ?? ""
            }).store(in: &anyCancellable)
    }

    func fetchWeather(for city: String) {
        homeRepository.fetchWeather(request: .init(query: city, appId: AppEnvironment.shared.appId))
    }
}

fileprivate extension Double {
    func toCelsius() -> String {
        let celsiusTemp = (self - 273.15).truncate(places: 2)
        return String(celsiusTemp)
    }
}

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
