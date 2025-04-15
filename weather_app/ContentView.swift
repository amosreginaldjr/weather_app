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
    @StateObject var forecastData = WeeklyForecastData()
    @State private var mainWeatherIcon: String = "cloud.sun.fill"
    
//    @State private var scale: CGFloat = 1.0
//    @State private var isTapped = false
    
    
//    var daysOfTheWeek: [DayOfTheWeek] =
//    [
//        DayOfTheWeek(dayOfTheWeek: "Mon", weatherIcon: "sun.max.fill", temperature: "65°"),
//        DayOfTheWeek(dayOfTheWeek: "Tue", weatherIcon: "cloud.sun.fill", temperature: "72°"),
//        DayOfTheWeek(dayOfTheWeek: "Wed", weatherIcon: "cloud.fill", temperature: "60°"),
//        DayOfTheWeek(dayOfTheWeek: "Thu", weatherIcon: "sun.max.fill", temperature: "78°"),
//        DayOfTheWeek(dayOfTheWeek: "Fri", weatherIcon: "cloud.rain.fill", temperature: "55°"),
//        DayOfTheWeek(dayOfTheWeek: "Sat", weatherIcon: "moon.stars.fill", temperature: "50°"),
//        DayOfTheWeek(dayOfTheWeek: "Sun", weatherIcon: "sun.max.fill", temperature: "80°")
//    ]
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                //BluredBackground()
                //Spacer()
                
                MainBackgroundColor(isDay: isDay)
                
                VStack
                {
                    /*MainTopData(city: locationManager.cityName, temperature: fahrenheitCelsius.temperature)
                        .onAppear {
                            Task {
                                await fahrenheitCelsius.convertToFahrenheit()
                                temperature = fahrenheitCelsius.temperature
                            }
                        }*/
                    
                    MainTopData(
                        city: locationManager.cityName,
                        temperature: fahrenheitCelsius.temperature,
                        weatherIcon: mainWeatherIcon //+ ".fill"
                    )
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
                            DaysOfTheWeekCenterScreen(forecastData: forecastData)
                        }
                    }
                    .padding([.trailing, .leading, .top], 5) //trailing, leading, top
                    .backgroundStyle(Color.blue.opacity(0.3))
                    .frame(width: 380)
                    .cornerRadius(30)
                    .scrollIndicators(.hidden)
                    
                    
                    //
                    let rows = [
                            GridItem(.fixed(10), spacing: 10),
                        ]
                    
                    Grid
                    {
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: rows, spacing: 5) {
                                FahrenheitToCelsiusButton(fahrenheitCelsius: fahrenheitCelsius) //button
//                                    .scaleEffect(isTapped ? 1.2 : 1.0)
//                                    .onTapGesture {
//                                        withAnimation(.spring()) {
//                                            isTapped.toggle()
//                                        }
//                                    }
                                    
                                
                                    .padding(.trailing, 20)
                                
                                DayNightButton(isDay: $isDay)
                            }
                            .padding(.leading, 20)
                        }
//                        .onTapGesture {
//                            .scaleEffect(scale)
//                            withAnimation(.spring()) {
//                            }
//                        }
                    }
                    //
                    
                    //FahrenheitToCelsiusButton(fahrenheitCelsius: fahrenheitCelsius) //button
                    Spacer(minLength: 190)
                }
            }
            .onAppear {
                locationManager.checkLocationAuthorization()
            }
            .onChange(of: locationManager.lastKnownLocationString) { _, newLocationString in
                Task {
                    await fahrenheitCelsius.convertToFahrenheit()
                    temperature = fahrenheitCelsius.temperature

                    // Parse the newLocationString into latitude and longitude
                    let coordinates = newLocationString.split(separator: ",").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }

                    if coordinates.count == 2 {
                        let latitude = coordinates[0]
                        let longitude = coordinates[1]
                        let location = CLLocation(latitude: latitude, longitude: longitude)
                        
                        forecastData.fetchForecast(for: location)
                        
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            if let firstDay = forecastData.daysOfTheWeek.first {
                                mainWeatherIcon = firstDay.weatherIcon
                            }
                        }
                    }
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
