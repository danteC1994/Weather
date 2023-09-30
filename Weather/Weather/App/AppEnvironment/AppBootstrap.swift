//
//  AppEnvironment.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Foundation
import Combine

class AppBootstrap {
    var anyCancellable = Set<AnyCancellable>()
    let sensitiveDataRepository: SensitiveDataRepository
    let sensitiveDataService: SensitiveDataServiceProvider

    var appIdSubject = PassthroughSubject<String, Never>()
    var appIdPublisher: AnyPublisher<String, Never>

    init(sensitiveDataRepository: SensitiveDataRepository, sensitiveDataService: SensitiveDataServiceProvider) {
        self.sensitiveDataRepository = sensitiveDataRepository
        self.sensitiveDataService = sensitiveDataService

        appIdPublisher = appIdSubject
            .map{$0}
            .eraseToAnyPublisher()
    }

    func start() {
        sensitiveDataService.requestAppId()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    break
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] appId in
                self?.sensitiveDataRepository
                    .saveKey(key: .init(key: .APPID, value: appId))
                self?.appIdSubject.send(appId)
            })
            .store(in: &anyCancellable)
    }
}
