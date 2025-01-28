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
    
    var body: some View
    {
        ZStack
        {
            BluredBackground()
            
            MainBackgroundColor(isDay: $isDay)
        
            VStack
            {
                MainTopData(city: "Staten Island", state: "NY", temperature: "65°")
                
                ZStack()
                {
                    ScrollView(.horizontal)
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
