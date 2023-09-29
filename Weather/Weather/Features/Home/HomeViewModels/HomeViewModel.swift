//
//  HomeViewModel.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var maxTemp = ""
    private var anyCancellable = Set<AnyCancellable>()

    private let homeRepository: HomeRepository

    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
        setUpBindings()
    }

    func setUpBindings() {
        homeRepository.cityWeatherPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    break
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] weather in
                print(weather)
                self?.maxTemp = String(weather.main?.tempMax ?? 0)
            }).store(in: &anyCancellable)
    }

    func fetchWeather(for city: String) {
        homeRepository.fetchWeather(request: .init(query: "London", appId: ""))
    }
}
