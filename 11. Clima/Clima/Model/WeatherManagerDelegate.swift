//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Yevhenii Orlov on 18.02.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weatherModel: WeatherModel)
    func didFailWithError(_ error: Error)
}
