//
//  SensitiveDataService.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Combine

class SensitiveDataService: SensitiveDataServiceProvider {
    func requestAppId() -> AnyPublisher<String, APIError> {
        return Just("0f12d7212e1a442cdd955a9f30cb1a3b")
            .mapError{ error in
                APIError.network(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
