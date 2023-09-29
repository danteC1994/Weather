//
//  HomeView.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        Text(viewModel.maxTemp)
            .onAppear{ viewModel.fetchWeather(for: "London") }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeView(viewModel: )
        EmptyView()
    }
}
