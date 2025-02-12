////
////  UserLocation.swift
////  weather_app
////
////  Created by Amos Reginald Jr. on 2/1/25.
////
////https://medium.com/@desilio/getting-user-location-with-swiftui-1f79d23c2321
//
//import Foundation
//import CoreLocation
//import SwiftUI
//
//final class UserLocation: NSObject, CLLocationManagerDelegate, ObservableObject
//{
//    @Published var lastKnownLocation: CLLocationCoordinate2D?
//    @Published var cityName: String = "Unknown City"
//    
//    
//    var manager = CLLocationManager()
//    let geocoder = CLGeocoder()
//    
//    func checkLocationAuthorization()
//    {
//        manager.delegate = self
//        manager.startUpdatingLocation()
//        
//        switch manager.authorizationStatus {
//        case .notDetermined:
//            manager.requestWhenInUseAuthorization()
//            
//        case .restricted:
//            print("Location restricted")
//            
//        case .denied:
//            print("Location denied")
//            
//        case .authorizedAlways, .authorizedWhenInUse:
//            print("Location authorized")
//            lastKnownLocation = manager.location?.coordinate
//            if let location = manager.location {
//                getCityName(from: location)
//            }
//            
//        @unknown default:
//            print("Location service disabled")
//        }
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)
//    {
//        checkLocationAuthorization()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
//    {
//        guard let location = locations.last else { return }
//        lastKnownLocation = location.coordinate
//        getCityName(from: location)
//    }
//    
//    func getCityName(from location: CLLocation)
//    {
//        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
//            guard let self = self, let placemark = placemarks?.first, error == nil else {
//                self?.cityName = "Unknown City"
//                return
//            }
//            self.cityName = placemark.locality ?? "Unknown City"
//        }
//    }
//}
//
//struct UserLocationMainView: View
//{
//    @StateObject private var userLocation = UserLocation()
//    
//    var body: some View
//    {
//        VStack
//        {
//            if let coordinate = userLocation.lastKnownLocation
//            {
//                Text("Latitude: \(coordinate.latitude)")
//                Text("Longitude: \(coordinate.longitude)")
//                Text("City: \(userLocation.cityName)")
//            }
//            
//            Text("City: \(userLocation.cityName)")
//                .font(.system(size: 32, weight: .semibold, design: .monospaced))
//                .foregroundColor(.black)
//                .fixedSize(horizontal: false, vertical: true)
//                .frame(maxWidth: .infinity, alignment: .bottom)
//            
//            Button("Get location")
//            {
//                userLocation.checkLocationAuthorization()
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding()
//    }
//}
