//
//  WeatherGetter.swift
//  WeatherApp
//
//  Created by Tuomas Käyhty on 31/01/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import Foundation

class WeatherGetter {

private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
private let openWeatherMapAPIKey = "620efed748msh02135f86d35f12ep168c6ejsn864af0ff2fc3"

func getWeather(city: String) {
  
  // This is a pretty simple networking task, so the shared session will do.
  let session = URLSession.shared
  
  let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&units=metric&q=\(city)")!
    
    print(weatherRequestURL)
  
  // The data task retrieves the data.
    let dataTask = session.dataTask(with: weatherRequestURL) {
    (data: Data?, response: URLResponse?, error: Error?) in
    if let error = error {
      // Case 1: Error
      // We got some kind of error while trying to get data from the server.
      print("Error:\n\(error)")
    }
    else {
      // Case 2: Success
      // We got a response from the server!
      print("Data:\n\(data!)")
    }
  }
  
  // The data task is set up...launch it!
  dataTask.resume()
}
}
