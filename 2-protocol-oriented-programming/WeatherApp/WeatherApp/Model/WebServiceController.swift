//
//  WebServiceController.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 02/04/2022.
//

import Foundation

public enum WebServiceControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

public protocol WebServiceController {
    func fetchWeatherData(for city: String, completionHandler: @escaping (String?, WebServiceControllerError?) -> Void)
}
