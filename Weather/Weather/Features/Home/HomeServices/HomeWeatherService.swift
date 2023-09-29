//
//  HomeWeatherService.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation
import Combine

struct WeatherByCityNameRequest {
    let query: String
}

struct HomeWeatherService: HomeWeatherFetchable {
    func requestWeather(url: URL) -> AnyPublisher<Weather, APIError> {
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                APIError.network(error.localizedDescription)
            }
            .map(\.data)
            .decode(type: Weather.self, decoder: JSONDecoder())
            .mapError { error in
                APIError.decoding(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
