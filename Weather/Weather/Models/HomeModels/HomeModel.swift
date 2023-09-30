//
//  HomeModel.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation

struct Weather: Decodable {
  let coord: Coord?
  let weather: [WeatherDetails]?
  let base: String?
  let main: Main?
  let visibility: Int?
  let wind: Wind?
  let clouds: Clouds?
  let dt: Int?
  let sys: Sys?
  let timezone: Int?
  let id: Int?
  let name: String?
  let cod: Int?
}


struct Main: Decodable {
  let temp: Double?
  let feelsLike : Double?
  let tempMin: Double?
  let tempMax: Double?
  let pressure: Int?
  let humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct WeatherDetails: Decodable {
  let id: Int?
  let main: String?
  let description: String?
  let icon: String?
}


struct Clouds: Decodable {
  let all: Int?
}


struct Wind: Decodable {

  let speed: Double?
  let deg: Int?
  let gust: Double?
}

struct Sys: Decodable {
  let pod: String?
}

struct Coord: Decodable {
  let lat: Double?
  let lon: Double?
}
