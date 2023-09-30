//
//  AppEnvironment.swift
//  Weather
//
//  Created by dante canizo on 29/09/2023.
//

import Foundation

class AppEnvironment {
    static var shared = AppEnvironment()
    var appId: String = ""
    
    private init() {}
}
