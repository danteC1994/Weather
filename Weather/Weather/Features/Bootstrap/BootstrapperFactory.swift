//
//  BootstrapperFactory.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import SwiftUI

class BootstrapperFactory {
    static func createBootstrapper() -> some View {
        let sensitiveDataStorage = SensitiveDataStorage()
        let sensitiveDataRepository = SensitiveDataRepository(sensitiveDataStorage: sensitiveDataStorage)
        let bootstrapper = AppBootstrap(
            sensitiveDataRepository: sensitiveDataRepository,
            sensitiveDataService: SensitiveDataService()
        )
        let bootstrapperViewModel = BootstrapperViewModel(bootstrapper: bootstrapper)
        return BootstrapperView(bootstrapperViewModel: bootstrapperViewModel)
    }
}
