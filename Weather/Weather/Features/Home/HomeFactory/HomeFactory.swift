//
//  HomeFactory.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import Foundation
import SwiftUI

class HomeFactory {
    static func createHome() -> some View {
        let homeViewModel = HomeViewModel()
        
        return HomeView(viewModel: homeViewModel)
    }
}
