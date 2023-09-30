//
//  SensitiveDataRepository.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Foundation
import Combine

class SensitiveDataRepository {
    private let sensitiveDataStorage: SensitiveDataStorageProvider
    
    var saveKeyChainValueSubject = PassthroughSubject<KeyChainValue<Any>, Never>()
    var getKeyChainValueSubject = PassthroughSubject<KeyChainValue<Any>.Key, Never>()
    var saveKeyChainValuePublisher: AnyPublisher<OSStatus, Never>
    var getKeyChainValuePublisher: AnyPublisher<Data?, Never>

    init(sensitiveDataStorage: SensitiveDataStorageProvider) {
        self.sensitiveDataStorage = sensitiveDataStorage

        saveKeyChainValuePublisher = saveKeyChainValueSubject
            .map { request in
                sensitiveDataStorage.saveToKeyChain(keyChainValue: request)
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()
        
        getKeyChainValuePublisher = getKeyChainValueSubject
            .map { key in
                sensitiveDataStorage.getFromKeyChain(key: key)
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()
    }
    
    func saveKey(key: KeyChainValue<Any>) {
        saveKeyChainValueSubject.send(key)
    }
    
    func getKey(key: KeyChainValue<Any>.Key) {
        getKeyChainValueSubject.send(key)
    }
}
