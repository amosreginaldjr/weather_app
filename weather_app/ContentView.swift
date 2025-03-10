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
    
//    @State private var scale: CGFloat = 1.0
//    @State private var isTapped = false
    
    
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
                //Spacer()
                
                MainBackgroundColor(isDay: isDay)
                
                VStack
                {
                    MainTopData(city: locationManager.cityName, temperature: fahrenheitCelsius.temperature)
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
                    .padding([.trailing, .leading, .top], 5) //trailing, leading, top
                    .backgroundStyle(Color.blue.opacity(0.3))
                    .frame(width: 390)
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
