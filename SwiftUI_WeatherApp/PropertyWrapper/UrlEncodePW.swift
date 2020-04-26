//
//  UrlEncodePW.swift
//  SwiftUI_WeatherApp
//
//  Created by Ivan Ivanov on 26.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

// fill in spaces of a user's url input
@propertyWrapper
class UrlEncode {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
    
}
