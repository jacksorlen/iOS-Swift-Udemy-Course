//
//  WeatherManager.swift
//  Clima
//
//  Created by Yevhenii Orlov on 17.02.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherManager {
    
    let token = "SECRET_TOKEN"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?APPID=\(token)&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performURL(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performURL(with: urlString)
    }
    
    /*
     1. Create a URL
     2. Create a URLSassion
     3. Give the session a task
     4. Start a task
     */
    func performURL(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    self.delegate?.didFailWithError(error!)
                }
                
                if let safeData = data {
                    if let weather = parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weatherModel: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            return WeatherModel(
                        conditionId: decodedData.weather[0].id,
                        cityName: decodedData.name,
                        temperature: decodedData.main.temp)
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
