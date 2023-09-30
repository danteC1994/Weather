//
//  KeychainUtils.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Security
import UIKit

struct KeyChainValue<T> {
    private let _key: Key
    private let value: T

    var key: String {
        _key.rawValue
    }
    var data: Data {
        Data(from: value)
    }
    
    init(key: Key, value: T) {
        self._key = key
        self.value = value
    }

    enum Key: String {
        case APPID
    }
}

class KeyChain {

    class func save<T>(keyChainValue: KeyChainValue<T>) -> OSStatus {
        let key = keyChainValue.key
        let data = keyChainValue.data

        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key,
            kSecValueData as String: data ] as [String : Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }

    class func load(key: KeyChainValue<Any>.Key) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne ] as [String : Any]

        var dataTypeRef: AnyObject? = nil

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        guard status == noErr, let data = dataTypeRef as? Data else { return nil }
        return data
    }

    class func createUniqueID() -> String {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let cfStr: CFString = CFUUIDCreateString(nil, uuid)

        let swiftString: String = cfStr as String
        return swiftString
    }
}

extension Data {
    init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }

    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.load(as: T.self) }
    }
}
