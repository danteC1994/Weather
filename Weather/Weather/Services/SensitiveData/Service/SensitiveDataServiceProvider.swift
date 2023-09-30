//
//  SensitiveDataServiceProvider.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Combine

protocol SensitiveDataServiceProvider {
    func requestAppId() -> AnyPublisher<String, APIError>
}
