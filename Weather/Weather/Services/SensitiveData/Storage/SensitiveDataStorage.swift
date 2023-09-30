//
//  SensitiveDataStorage.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Foundation
import Combine
import Security

class SensitiveDataStorage: SensitiveDataStorageProvider {
    func saveToKeyChain<T>(keyChainValue: KeyChainValue<T>) -> AnyPublisher<OSStatus, Never> {
        return Just(KeyChain.save(keyChainValue: keyChainValue))
            .eraseToAnyPublisher()
    }

    func getFromKeyChain(key: KeyChainValue<Any>.Key) -> AnyPublisher<Data?, Never> {
        return Just(KeyChain.load(key: key))
            .eraseToAnyPublisher()
    }
}
