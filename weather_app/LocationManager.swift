//
//  LocationManager.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 2/2/25.
//

import Foundation
import CoreLocation
import SwiftUI

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    @Published var cityName: String = "Unknown City"
    //@Published var stateAbbreviation: String = "UNKSPV" //unknown state
    var manager = CLLocationManager()
    let geocoder = CLGeocoder()
    
//    let stateAbbreviations = [
//        "Alabama": "AL", "Alaska": "AK", "Arizona": "AZ", "Arkansas": "AR", "California": "CA",
//        "Colorado": "CO", "Connecticut": "CT", "Delaware": "DE", "Florida": "FL", "Georgia": "GA",
//        "Hawaii": "HI", "Idaho": "ID", "Illinois": "IL", "Indiana": "IN", "Iowa": "IA",
//        "Kansas": "KS", "Kentucky": "KY", "Louisiana": "LA", "Maine": "ME", "Maryland": "MD",
//        "Massachusetts": "MA", "Michigan": "MI", "Minnesota": "MN", "Mississippi": "MS", "Missouri": "MO",
//        "Montana": "MT", "Nebraska": "NE", "Nevada": "NV", "New Hampshire": "NH", "New Jersey": "NJ",
//        "New Mexico": "NM", "New York": "NY", "North Carolina": "NC", "North Dakota": "ND", "Ohio": "OH",
//        "Oklahoma": "OK", "Oregon": "OR", "Pennsylvania": "PA", "Rhode Island": "RI", "South Carolina": "SC",
//        "South Dakota": "SD", "Tennessee": "TN", "Texas": "TX", "Utah": "UT", "Vermont": "VT",
//        "Virginia": "VA", "Washington": "WA", "West Virginia": "WV", "Wisconsin": "WI", "Wyoming": "WY"
//    ]
    
    func checkLocationAuthorization() {
        
        manager.delegate = self
        manager.startUpdatingLocation()
        
        switch manager.authorizationStatus {
        case .notDetermined://The user choose allow or denny your app to get the location yet
            manager.requestWhenInUseAuthorization()
            
        case .restricted://The user cannot change this app’s status, possibly due to active restrictions such as parental controls being in place.
            print("Location restricted")
            
        case .denied://The user dennied your app to get location or disabled the services location or the phone is in airplane mode
            print("Location denied")
            
        case .authorizedAlways://This authorization allows you to use all location services and receive location events whether or not your app is in use.
            print("Location authorizedAlways")
            lastKnownLocation = manager.location?.coordinate
            
        case .authorizedWhenInUse://This authorization allows you to use all location services and receive location events only when your app is in use
            print("Location authorized when in use")
            lastKnownLocation = manager.location?.coordinate
            
        @unknown default:
            print("Location service disabled")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {//Trigged every time authorization status changes
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastKnownLocation = location.coordinate
        
        getCityName(from: location)
        //getStateAbbreviation(from: location)
    }
    
    func getCityName(from location: CLLocation)
        {
            geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
                guard let self = self, let placemark = placemarks?.first, error == nil else {
                    self?.cityName = "Unknown City"
                    return
                }
                self.cityName = placemark.locality ?? "Unknown City"
            }
        }
    
//    func getStateAbbreviation(from location: CLLocation) {
//        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
//            guard let self = self, let placemark = placemarks?.first, error == nil else {
//                self?.stateAbbreviation = "UNKSAB" // Default to "UNKSAB" if not available
//                return
//            }
//            
//            let fullStateName = placemark.administrativeArea?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Unknown State"
//            
//            // Map full state name to abbreviation
//            let abbreviation = self.stateAbbreviations[fullStateName] ?? "UNKSAB"
//            
//            self.stateAbbreviation = abbreviation
//        }
//    }
}

struct LocationManagerMainView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let coordinate = locationManager.lastKnownLocation {
                Text("Latitude: \(coordinate.latitude)")
                
                Text("Longitude: \(coordinate.longitude)")
                
                Text("City: \(locationManager.cityName)")
                
                //Text("State: \(locationManager.stateAbbreviation)")
            } else {
                Text("Unknown Location")
            }
            
            
            Button("Get location") {
                locationManager.checkLocationAuthorization()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
