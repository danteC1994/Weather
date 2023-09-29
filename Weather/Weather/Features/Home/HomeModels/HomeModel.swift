//
//  HomeModel.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation

//{"coord":{"lon":-0.1257,"lat":51.5085},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":18.33,"feels_like":18.54,"temp_min":16.83,"temp_max":19.64,"pressure":1005,"humidity":89},"visibility":10000,"wind":{"speed":4.02,"deg":176,"gust":5.81},"clouds":{"all":100},"dt":1695945825,"sys":{"type":2,"id":2075535,"country":"GB","sunrise":1695967025,"sunset":1696009484},"timezone":3600,"id":2643743,"name":"London","cod":200}

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
