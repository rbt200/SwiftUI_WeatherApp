//
//  WeatherService.swift
//  SwiftUI_WeatherApp
//
//  Created by Ivan Ivanov on 12.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

class WeatherService {

    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {

        let resource = Resource(city: city)
        guard let url = URL(string: resource.url) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}


struct Resource {

    @UrlEncode
    var city: String

    var url: String {
        "http://openweathermap.org/data/2.5/weather?q=\(city)&appid=439d4b804bc8187953eb36d2a8c26a02"
    }
}

extension Resource {
    init(city: String) {
        self.city = city
    }
}







//class WeatherService {
//
//    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
//        guard let url = URL(string: "http://openweathermap.org/data/2.5/weather?q=\(city)&appid=439d4b804bc8187953eb36d2a8c26a02") else {
//            completion(nil)
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            guard let data = data, error == nil else {
//                completion(nil)
//                return
//            }
//
//            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
//            if let weatherResponse = weatherResponse {
//                let weather = weatherResponse.main
//                completion(weather)
//            } else {
//                completion(nil)
//            }
//        }.resume()
//    }
//}
