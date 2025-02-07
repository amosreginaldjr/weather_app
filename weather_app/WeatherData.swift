//
//  WeatherData.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/28/25.
//

//https://medium.com/@yugasamuelmuel/how-to-integrate-weatherkit-in-a-swiftui-app-0adacab44136

import Foundation
import WeatherKit
import os
import CoreLocation


@Observable class WeatherData: ObservableObject {
    private let weatherService = WeatherService()
    var weather: Weather?
    
    
    
//    func getWeatherForCity(cityName: String) async throws -> Weather {
//
//        let geocoder = CLGeocoder()
//
//        let placemarks = try await geocoder.geocodeAddressString(cityName)
//
//        guard let location = placemarks.first?.location else {
//
//            throw NSError(domain: "GeocodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not find location for city"])
//
//        }
        
        
    func getWeather(lat: Double, long: Double) async {
        do {
            weather = try await Task.detached(priority: .userInitiated) { [weak self] in
                return try await self?.weatherService.weather(for: .init(latitude: lat, longitude: long))
            }.value
            
        } catch {
            print("Failed to get weather data. \(error)")
        }
    }
    
    

    
    
    
    func getWeatherForCurrentLocation() async {
        do {
            let locationManager = CLLocationManager()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            guard CLLocationManager.locationServicesEnabled() else {
                print("Location services are not enabled")
                return
            }
        }
    }
    
    
    
    
    

    var icon: String
    {
        guard let iconName = weather?.currentWeather.symbolName else { return "--" }
        
        return iconName
    }
    
    var temperature: String
    {
        guard let temp = weather?.currentWeather.temperature else { return "--" }
        let convert = temp.converted(to: .fahrenheit).value
        
        return String(Int(convert)) + "°" //previously: "°F"
    }
    
    var humidity: String
    {
        guard let humidity = weather?.currentWeather.humidity else { return "--" }
        let computedHumidity = humidity * 100
        
        return String(Int(computedHumidity)) + "%"
    }
}
