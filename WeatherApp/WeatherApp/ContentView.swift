//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tuomas Käyhty on 20/01/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    @State var city: String = ""
    
    var body: some View {
            VStack() {
                TextField("Enter your city", text: $city){
                    self.weather.fetch(by: self.city)
                }.padding(.horizontal)
                
                GeometryReader{ gr in
                    CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : gr.size.height * 0.50).animation(.easeInOut(duration: 0.5))
                }
}
}
}

extension Double {
    var round: Int {
        return Int(self)
    }
}
