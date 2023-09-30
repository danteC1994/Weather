//
//  HomeView.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                    List {
                        ForEach(viewModel.cities) { city in
                            CityRow(cityName: city.name)
                                .onTapGesture {
                                    // home details
                                }
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                    .frame(maxHeight: .infinity)
            }
        }
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
