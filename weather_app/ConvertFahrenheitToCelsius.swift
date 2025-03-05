//
//  ConvertFahrenheitToCelsius.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 3/5/25.
//

import SwiftUI
import CoreLocation
import Foundation
import WeatherKit

class ConvertFahrenheitToCelsius: ObservableObject
{
    @Published var temperature: String = "Loading..."
    @Published var isFahrenheit: Bool = true
    let locationManager = CLLocationManager()
    let weatherService = WeatherService()
    
    @MainActor func convertToFahrenheit() async {
        guard let location = locationManager.location else {
            temperature = "Location Unavailable"
            return
        }
        
        do {
            let weather = try await weatherService.weather(for: location)
            
            let temperatureCelsius = weather.currentWeather.temperature.converted(to: .celsius).value
            let convertedTemperature = isFahrenheit
                ? (temperatureCelsius * 9.0 / 5.0) + 32.0 // Fahrenheit
                : temperatureCelsius // Celsius
            
            let unit = isFahrenheit ? "°F" : "°C"
            
            self.temperature = String(format: "%.1f%@", convertedTemperature, unit)
            
            
        } catch {
            print("Error fetching weather: \(error)")
            
            // Update the UI on the main thread if the request fails
            DispatchQueue.main.async {
                self.temperature = "Weather Unavailable"
            }
        }
    }
}
