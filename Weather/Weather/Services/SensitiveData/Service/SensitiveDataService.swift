//
//  SensitiveDataService.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Combine

//TODO: api key Should be retrieved from service or at least should be added as an info.plist item.
class SensitiveDataService: SensitiveDataServiceProvider {
    func requestAppId() -> AnyPublisher<String, APIError> {
        // Add your api key here
        return Just("")
            .mapError{ error in
                APIError.network(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
