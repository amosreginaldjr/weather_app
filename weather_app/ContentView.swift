//
//  ContentView.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/23/25.
//

/*used to for navigation link
https://stackoverflow.com/questions/56437335/go-to-a-new-view-using-swiftui*/

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ContentView: View
{
    @State var isDay = true
    @StateObject var locationManager = LocationManager()
    @State private var temperature: String = "Loading..."
    @StateObject var fahrenheitCelsius = ConvertFahrenheitToCelsius()
    
    
    var daysOfTheWeek: [DayOfTheWeek] =
                    [DayOfTheWeek(dayOfTheWeek: "Mon", weatherIcon: "moon.stars.fill", temperature: "65°"),
                     DayOfTheWeek(dayOfTheWeek: "Tue", weatherIcon: "moon.stars.fill", temperature: "97°"),
                     DayOfTheWeek(dayOfTheWeek: "Wed", weatherIcon: "moon.stars.fill", temperature: "72°"),
                     DayOfTheWeek(dayOfTheWeek: "Thu", weatherIcon: "moon.stars", temperature: "84°"),
                     DayOfTheWeek(dayOfTheWeek: "Fri", weatherIcon: "moon.stars.fill", temperature: "68°"),
                     DayOfTheWeek(dayOfTheWeek: "Sat", weatherIcon: "moon.stars.fill", temperature: "27°"),
                     DayOfTheWeek(dayOfTheWeek: "Sun", weatherIcon: "moon.stars.fill", temperature: "66°")]
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                //BluredBackground()
                
                MainBackgroundColor(isDay: $isDay)
                
                VStack
                {
                    MainTopData(city: locationManager.cityName, temperature: temperature)
                        .onAppear {
                            Task {
                                await fahrenheitCelsius.convertToFahrenheit()
                                temperature = fahrenheitCelsius.temperature
                            }
                        }
                    
                    GroupBox() //was previously ZStack()
                    {
                        ScrollView(.horizontal)
                        {
                            DaysOfTheWeekCenterScreen(daysOfTheWeek: daysOfTheWeek)
                        }
                    }
                    .backgroundStyle(Color.blue.opacity(0.3))
                    .frame(width: 390)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(30)
                    .scrollIndicators(.hidden)
                    
                    
                    
                    
                    
                    Button(action: {
                        Task {
                            fahrenheitCelsius.isFahrenheit.toggle()
                            await fahrenheitCelsius.convertToFahrenheit() // Fetch and convert weather data
                            temperature = fahrenheitCelsius.temperature
                        }
                    }) {
                        Text(fahrenheitCelsius.isFahrenheit ? "Switch to Celsius" : "Switch to Fahrenheit")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    
                    
                    
                    
                    
                    Spacer(minLength: 190)
                }
            }
            .onAppear {
                locationManager.checkLocationAuthorization()
            }
            .onChange(of: locationManager.lastKnownLocationString) { _, _ in
                Task {
                    await fahrenheitCelsius.convertToFahrenheit()
                    temperature = fahrenheitCelsius.temperature
                }
            }
        }
    }
}

/*
 Text("Latitude: \(userLocation.lastKnownLocation?.latitude ?? 0.0)")
 Text("Longitude: \(userLocation.lastKnownLocation?.longitude ?? 0.0)")
 */

#Preview
{
    ContentView()
}
