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
                    MainTopData(city: "Staten Island", state: "NY", temperature: "65°")
                    
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

//func detectDayNight() -> Bool {}
