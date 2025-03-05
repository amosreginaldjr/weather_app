//
//  LocationManager.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 2/2/25.
//

import Foundation
import CoreLocation
import SwiftUI
import WeatherKit

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject
{
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    @Published var cityName: String = "Unknown City"
    var manager = CLLocationManager()
    let geocoder = CLGeocoder()
    var weatherService = WeatherService()
    
    override init() {
        super.init()
        weatherService = WeatherService()  // Initialize the weather service
    }
    
    func checkLocationAuthorization() {
        manager.delegate = self
        manager.startUpdatingLocation()
        
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Location access denied or restricted")
        case .authorizedAlways, .authorizedWhenInUse:
            lastKnownLocation = manager.location?.coordinate
        @unknown default:
            print("Location service disabled")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastKnownLocation = location.coordinate
        getCityName(from: location)
    }
    
    func getCityName(from location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first, error == nil else {
                self?.cityName = "Unknown City"
                return
            }
            self.cityName = placemark.locality ?? "Unknown City"
        }
    }
    
    var lastKnownLocationString: String {
        guard let loc = lastKnownLocation else { return "Unknown" }
        return "\(loc.latitude),\(loc.longitude)"
    }
    
    func currentWeather(for location: CLLocation) async -> String? {
        do {
            let weather = try await weatherService.weather(for: location)
            
            return "\(weather.currentWeather.temperature.converted(to: .fahrenheit).value.rounded(.up).formatted())°F"
        } catch {
            print("Error fetching weather: \(error)")
            return nil
        }
    }
}
