//
//  ContentView.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/23/25.
//

import SwiftUI

struct ContentView: View
{
    @State var isDay = true
    
    @StateObject var weatherData = WeatherData()
    
    var body: some View
    {
        ZStack
        {
            
            BluredBackground()
            
            MainBackgroundColor(isDay: $isDay)
        
            VStack
            {
                //MainTopData(city: "Staten Island", state: "NY", temperature: "65°")
                MainTopData(city: "San Francisco", state: "CA", weatherData: weatherData)
                    .task {
                                await weatherData.getWeather(lat: 37.7749, long: -122.4194) // Example: San Francisco
                                }
//                    .task {
//                                await weatherData.getWeather(lat: 37.7749, long: -122.4194) // Example: San Francisco
//                                }
                
                
                
                ZStack()
                {
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        HStack(spacing: 15)
                        {
                            DayOfTheWeek(dayOfTheWeek: "Mon", temperature: "65°")
                            WeatherSpacer()
                            DayOfTheWeek(dayOfTheWeek: "Tue", temperature: "97°")
                            WeatherSpacer()
                            DayOfTheWeek(dayOfTheWeek: "Wed", temperature: "72°")
                            WeatherSpacer()
                            DayOfTheWeek(dayOfTheWeek: "Thu", temperature: "84°")
                            WeatherSpacer()
                            DayOfTheWeek(dayOfTheWeek: "Fri", temperature: "68°")
                            WeatherSpacer()
                            DayOfTheWeek(dayOfTheWeek: "Sat", temperature: "55°")
                            WeatherSpacer()
                            DayOfTheWeek(dayOfTheWeek: "Sun", temperature: "32°")
                        }
                    }
                    
                }
                Spacer(minLength: 270)
                
                DayNightButton(isDay: $isDay)
            }
        }
    }
}

#Preview
{
    ContentView()
}

//func detectDayNight() -> Bool {}
