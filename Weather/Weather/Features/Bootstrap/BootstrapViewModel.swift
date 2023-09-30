//
//  BootstrapViewModel.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import Combine
import Foundation

class BootstrapperViewModel: ObservableObject {
    var anyCancellable = Set<AnyCancellable>()
    let bootstrapper: AppBootstrap
    @Published var appId = ""

    init(bootstrapper: AppBootstrap) {
        self.bootstrapper = bootstrapper
        
        bootstrapper.appIdPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] appId in
                AppEnvironment.shared.appId = appId
                self?.appId = appId
            })
            .store(in: &anyCancellable)
    }

    func start() {
        bootstrapper.start()
    }
}

