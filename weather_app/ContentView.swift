//
//  ContentView.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/23/25.
//

/*used to for navigation link
https://stackoverflow.com/questions/56437335/go-to-a-new-view-using-swiftui*/

import SwiftUI

struct ContentView: View
{
    @State var isDay = true
    
    @StateObject private var userLocation = UserLocation() //instance of UserLocation.swift
    
    var body: some View
    {
        NavigationView
        {

            
            
            
            //
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
                    
                    
                    //
                    NavigationLink(destination: LocationManagerMainView()){
                        
                        Text("Button to get your Location") //make a spacer, ramen said that the white bar overlaps this button
                    }
                    .buttonStyle(.borderedProminent)
                    //.padding(.bottom, 40)
                    //
                    
                }
            }
            //
            
            
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


func weatherScreen()
{
    
}

//func detectDayNight() -> Bool {}
