//
//  HomeRepository.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Combine
import Foundation

struct CityWeatherRequest {
    //q=London&mode=json&units=metric&APPID=0f12d7212e1a442cdd955a9f30cb1a3b
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

class HomeDetailsRepository {
    private let weatherService: HomeWeatherFetchable
    
    private var anyCancellable = Set<AnyCancellable>()
    private var cityWeatherSubject = PassthroughSubject<CityWeatherRequest, APIError>()
    private(set) var cityWeatherPublisher: AnyPublisher<Weather, APIError>

    init(weatherService: HomeWeatherFetchable) {
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
