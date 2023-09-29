//
//  APIErrors.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation

enum APIError: Error {
    case url(_ errorDescription: String)
    case network(_ errorDescription: String)
    case decoding(_ errorDescription: String)
}
