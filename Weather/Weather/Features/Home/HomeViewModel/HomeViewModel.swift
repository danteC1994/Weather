//
//  HomeViewModel.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import Foundation

enum City: CaseIterable, Identifiable {
    var id: UUID {
        return UUID()
    }
    
    case currentLocation
    case london
    case montevideo
    case buenosAires

    var name: String {
        switch self {
        case .currentLocation:
            return "Current Location"
        case .london:
            return "London"
        case .montevideo:
            return "Montevideo"
        case .buenosAires:
            return "Buenos Aires"
        }
    }
}

class HomeViewModel: ObservableObject {
      @Published var cities = [City]()

    func getCities() {
        self.cities = City.allCases
    }
}
