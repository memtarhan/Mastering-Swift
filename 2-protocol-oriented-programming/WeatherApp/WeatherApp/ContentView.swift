//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var city: String = ""

    var body: some View {
        VStack {
            TextField("Enter city", text: $city)
                .font(.title)
            Divider()
            Text(city)
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
