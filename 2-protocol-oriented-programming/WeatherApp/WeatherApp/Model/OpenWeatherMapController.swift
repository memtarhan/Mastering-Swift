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

        let dataTask = URLSession.shared.dataTask(with: endpointURL) { data, _, error in
            guard error == nil else {
                completionHandler(nil, .forwarded(error!))
                return
            }

            guard let responseData = data else {
                completionHandler(nil, .invalidPayload(endpointURL))
                return
            }

            let decoder = JSONDecoder()
            do {
                let weatherData = try decoder.decode(OpenMapWeatherData.self, from: responseData)
                guard let weather = weatherData.weather.first?.main,
                      let temperature = weatherData.main.temp else {
                    completionHandler(nil, .invalidPayload(endpointURL))
                    return
                }

                let weatherDescription = "\(weather) \(temperature) C"
                completionHandler(weatherDescription, nil)

            } catch {
                completionHandler(nil, .forwarded(error))
            }
        }

        dataTask.resume()
    }
}
