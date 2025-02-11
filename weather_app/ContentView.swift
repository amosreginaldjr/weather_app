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
    
    
    /*
     Trying to make an array of days of the week
     this will allow me to make 'element n' larger than the others as the user scrolls through
     */
    var daysOfTheWeek: [DayOfTheWeek] = //not sure if it is supposed to be [Body]
                                [DayOfTheWeek(dayOfTheWeek: "Mon", temperature: "65°"),
                                 DayOfTheWeek(dayOfTheWeek: "Tue", temperature: "97°"),
                                 DayOfTheWeek(dayOfTheWeek: "Wed", temperature: "72°"),
                                 DayOfTheWeek(dayOfTheWeek: "Thu", temperature: "84°"),
                                 DayOfTheWeek(dayOfTheWeek: "Fri", temperature: "68°"),
                                 DayOfTheWeek(dayOfTheWeek: "Sat", temperature: "27°"),
                                 DayOfTheWeek(dayOfTheWeek: "Sun", temperature: "66°")]
    
    var body: some View
    {
        NavigationView
        {
            //
            ZStack
            {
                //BluredBackground()
                
                MainBackgroundColor(isDay: $isDay)
                
                VStack
                {
                    MainTopData(city: "Staten Island", state: "NY", temperature: "65°")
                    
                    GroupBox() //was previously ZStack()
                    {
                        ScrollView(.horizontal)
                        {
                            HStack(spacing: 15)
                            {
                                ForEach(daysOfTheWeek, id: \.dayOfTheWeek) { day in
                                    DayOfTheWeek(dayOfTheWeek: day.dayOfTheWeek,
                                                 temperature: day.temperature)
                                    WeatherSpacer()
                                }
                                
                                //for each loop to output the days in the GroupBox
//                                DayOfTheWeek(dayOfTheWeek: "Mon", temperature: "65°")
//                                WeatherSpacer()
//                                DayOfTheWeek(dayOfTheWeek: "Tue", temperature: "97°")
//                                WeatherSpacer()
//                                DayOfTheWeek(dayOfTheWeek: "Wed", temperature: "72°")
//                                WeatherSpacer()
//                                DayOfTheWeek(dayOfTheWeek: "Thu", temperature: "84°")
//                                WeatherSpacer()
//                                DayOfTheWeek(dayOfTheWeek: "Fri", temperature: "68°")
                            }
                        }
                    }
                    .backgroundStyle(Color.blue.opacity(0.3))
                    .frame(width: 390)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .cornerRadius(30)
                    .scrollIndicators(.hidden)
                    
                    
                    
                    Spacer(minLength: 190)
                    
                    //DayNightButton(isDay: $isDay)
                    
                    
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
