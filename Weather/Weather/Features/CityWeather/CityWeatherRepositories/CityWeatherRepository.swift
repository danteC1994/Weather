//
//  HomeRepository.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Combine
import Foundation

struct CityWeatherRequest {
    let query: String
    let mode: Mode = .json
    let units: Units = .standard
    let appId: String

    func queryItems() -> [URLQueryItem] {
        [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "mode", value: mode.rawValue),
            URLQueryItem(name: "units", value: units.rawValue),
            URLQueryItem(name: "APPID", value: appId),
        ]
    }

    enum Mode: String {
        case json
        case xml
        case html
    }

    enum Units: String {
        case standard
        case metric
        case imperial
    }
}

class CityWeatherRepository {
    private let weatherService: CityWeatherFetchable
    
    private var anyCancellable = Set<AnyCancellable>()
    private var cityWeatherSubject = PassthroughSubject<CityWeatherRequest, APIError>()
    private(set) var cityWeatherPublisher: AnyPublisher<Weather, APIError>

    init(weatherService: CityWeatherFetchable) {
        self.weatherService = weatherService

        cityWeatherPublisher = cityWeatherSubject
            .map { request in
                weatherService.requestWeather(request: request)
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()
    }

    func fetchWeather(request: CityWeatherRequest) {
        cityWeatherSubject.send(request)
    }
}
