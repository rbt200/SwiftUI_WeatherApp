//
//  Weather.swift
//  SwiftUI_WeatherApp
//
//  Created by Ivan Ivanov on 12.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    
    var main: Weather
    
}

struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
    
}
