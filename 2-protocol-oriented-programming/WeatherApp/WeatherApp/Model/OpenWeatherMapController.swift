//
//  OpenWeatherMapController.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 02/04/2022.
//

import Foundation

private enum API {
    static let apiKey = "507cf4e20f94c76ef6efffc0851f7946"
    static let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
}

class OpenWeatherMapController: WebServiceController {
    func fetchWeatherData(for city: String, completionHandler: @escaping (String?, WebServiceControllerError?) -> Void) {
        let endpoint = "\(API.baseURL)q=\(city)&units=metric&appid=\(API.apiKey)"

        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let endpointURL = URL(string: safeURLString) else {
            completionHandler(nil, .invalidURL(endpoint))
            return
        }
    }
}
