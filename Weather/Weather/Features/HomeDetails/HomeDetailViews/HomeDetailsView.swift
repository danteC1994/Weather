//
//  HomeView.swift
//  Weather
//
//  Created by dante canizo on 25/09/2023.
//

import SwiftUI

struct HomeDetailsView: View {
    @ObservedObject var viewModel: HomeDetailsViewModel
    var body: some View {
        Text(viewModel.maxTemp)
            .onAppear{ viewModel.fetchWeather(for: "London") }
    }
}

struct HomeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeView(viewModel: )
        EmptyView()
    }
}
