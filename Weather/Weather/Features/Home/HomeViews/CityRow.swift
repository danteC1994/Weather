//
//  CityRow.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import SwiftUI

struct CityRow: View {
    let cityName: String
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 16, height: 16))
            .foregroundColor(Color.secondary)
            .listRowBackground(
                Text(cityName)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
            )
            .cornerRadius(8)
            .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        CityRow(cityName: "London")
    }
}
