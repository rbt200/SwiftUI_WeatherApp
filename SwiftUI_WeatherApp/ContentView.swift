//
//  ContentView.swift
//  SwiftUI_WeatherApp
//
//  Created by Ivan Ivanov on 12.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }
            .font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()
            
            Text(self.weatherVM.temperature)
                .font(.custom("Arial", size: 100))
                .foregroundColor(Color.white)
                .offset(y: -50)
                .padding()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
