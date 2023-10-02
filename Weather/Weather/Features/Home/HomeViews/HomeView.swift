//
//  HomeView.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var navigate: Bool = false
    @State var selectedCity: String = ""

    var body: some View {
        NavigationView {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                    List {
                        ForEach(viewModel.cities) { city in
                            CityRow(cityName: city.name)
                                .onTapGesture {
                                    selectedCity = city.name
                                    navigate = true
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(maxHeight: .infinity)
                NavigationLink(
                    destination: CityWeatherFactory.createCityWeather(for: selectedCity)
                        .navigationBarTitle("")
                        .navigationBarHidden(false),
                    isActive: $navigate
                ) {}
            }
        }
        .accentColor(.black)
        .onAppear{
            viewModel.getCities()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
