//
//  WeatherURL.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation

protocol WeatherAPIBase {
    var scheme: String { get }
    var host: String { get }
    var basePath: String { get }
}

extension WeatherAPIBase {
    var scheme: String { "https" }
    var host: String { "api.openweathermap.org" }
    var basePath: String { "/data/2.5" }
//        "https://api.openweathermap.org/data/2.5/forecast?q=London&mode=json&units=metric&APPID="
}

protocol WeatherEndpoint: WeatherAPIBase {
    var endpointPath: String { get }
    var queryItems: [URLQueryItem] { get }

    func getUrlRequest() -> URL?
}

extension WeatherEndpoint {
    func getEndpointUrlComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = basePath + endpointPath
        return components
    }

    func getUrlRequest() -> URL? {
        var endpointUrlComponents = getEndpointUrlComponents()
        endpointUrlComponents.queryItems = queryItems
        
        return endpointUrlComponents.url
    }
}

struct cityWeatherEndpoint: WeatherEndpoint {
    var endpointPath = "/weather"
    let queryItems: [URLQueryItem]
}
