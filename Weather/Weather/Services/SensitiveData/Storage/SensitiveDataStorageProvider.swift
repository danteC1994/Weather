//
//  SensitiveDataProvider.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Foundation
import Combine
import Security

protocol SensitiveDataStorageProvider {
    func saveToKeyChain(keyChainValue: KeyChainValue<Any>) -> AnyPublisher<OSStatus, Never>
    func getFromKeyChain(key: KeyChainValue<Any>.Key) -> AnyPublisher<Data?, Never>
}
