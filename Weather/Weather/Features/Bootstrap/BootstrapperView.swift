//
//  BootstrapperView.swift
//  Weather
//
//  Created by dante canizo on 30/09/2023.
//

import SwiftUI

struct BootstrapperView: View {
    @ObservedObject var bootstrapperViewModel: BootstrapperViewModel
    @State var navigate: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: HomeFactory.createHome()
                    .navigationBarTitle("")
                    .navigationBarHidden(true),
                isActive: $navigate
            ) {}
        }
        .navigationViewStyle(.stack)
        .onAppear{ bootstrapperViewModel.start() }
        .onChange(of: bootstrapperViewModel.appId) { newValue in
            navigate = !newValue.isEmpty
        }
    }
}



struct BootstrapperView_Previews: PreviewProvider {
    static var previews: some View {
        BootstrapperFactory.createBootstrapper()
    }
}
