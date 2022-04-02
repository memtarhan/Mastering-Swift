//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var city: String = ""

    @ObservedObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            TextField("Enter city", text: $city, onEditingChanged: { _ in

            }, onCommit: {
                if !self.city.isEmpty {
                    self.viewModel.fetch(city: self.city)
                }
            })
                .font(.title)
            Divider()
            Text(viewModel.weatherInfo)
                .font(.body)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
