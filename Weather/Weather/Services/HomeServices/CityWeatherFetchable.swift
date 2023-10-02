//
//  HomeWeatherServiceProtocol.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Combine

protocol CityWeatherFetchable {
    func requestWeather(request: CityWeatherRequest) -> AnyPublisher<Weather, APIError>
}
