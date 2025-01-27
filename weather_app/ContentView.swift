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
            
            MainBackgroundColor()
        
            VStack
            {
                MainTopData(city: "Staten Island", state: "NY", temperature: "65°")
                
                ZStack()
                {
                    HStack(spacing: 15)
                    {
                        DayOfTheWeek(dayOfTheWeek: "Mon", temperature: "65°")
                        WeatherSpacer()
                        DayOfTheWeek(dayOfTheWeek: "Tue", temperature: "97°")
                        WeatherSpacer()
                        DayOfTheWeek(dayOfTheWeek: "Wed", temperature: "72°")
                        //WeatherSpacer()
                        //DayOfTheWeek(dayOfTheWeek: "Thu", temperature: "84°")
                        //WeatherSpacer()
                        //DayOfTheWeek(dayOfTheWeek: "Fri", temperature: "68°")
                    }
                }
                Spacer(minLength: 270)
                
                
                
                Button("Day Night"){
                    print("day night")
                }
                .frame(width: 290, height: 60)
                .background(Color("MurkyBlue"))
                .scaledToFill()
                .cornerRadius(30)
                .padding(.bottom)
            }
            
        }
    }
}

#Preview
{
    ContentView()
}


struct MainTopData: View
{
    //variables
    var city: String = "NULL CITY"
    var state: String = "NULL STATE"
    var temperature: String = "NULL"
    
    var body: some View
    {
        Text(city + ", " + state) //city, state
            .font(.system(size: 32, weight: .semibold, design: .monospaced))
            .foregroundColor(.white)
            .fixedSize(horizontal: false, vertical: true) //makes the text wrap to the next line so it does not go off screen
            .padding()
        
        //weather icon and temperature
        VStack(alignment: .center, spacing: 10)
        {
            Image(systemName: "sun.rain.fill")
                .renderingMode(.original)//.symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 160)
            
            Text(temperature)
                .font(.system(size: 40, weight: .medium, design: .monospaced))
                .foregroundColor(.white)
        }
        //Spacer() //when i have this it brings things closer together, why?
    }
}

struct DayOfTheWeek: View
{
    //variables
    var dayOfTheWeek: String = "NULL"
    var temperature: String = "NULL"
    
    var body: some View
    {
        VStack
        {
            //day of week
            Text(dayOfTheWeek)
                .foregroundColor(.white)
            //icon
            Image(systemName: "sun.max.fill")
                .renderingMode(.original)
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
            
            
            //temperature
            Text(temperature)
                .font(.system(size: 29, weight: .medium, design: .monospaced))
                .foregroundColor(.white)
        }
    }
}

struct WeatherSpacer: View
{
    //variables
    var characterToDisplay: String = "|"
    var size: CGFloat = 100
    var textWeight: Font.Weight? = .ultraLight
    var textDesign: Font.Design? = .default
    var frameWidth: CGFloat? = 10
    var frameHeight: CGFloat? = 80
    
    var body: some View
    {
        ZStack
        {
            Text(characterToDisplay)
                .font(.system(size: size,
                              weight: textWeight,
                              design: textDesign))
                .frame(width: frameWidth,
                       height: frameHeight)
        }
    }
}

struct BluredBackground: View
{
    //variables
    
    var body: some View
    {
        //the sub box for the days in the middle
        Image(systemName: "rectangle.fill")
            .symbolRenderingMode(.palette)
            .resizable()
            .foregroundColor(Color("SubtleBlue"))
            .frame(width: 370, height: 200)
            .aspectRatio(contentMode: .fill)
            .blur(radius: 7)
    }
}


struct MainBackgroundColor: View
{
    var body: some View
    {
            LinearGradient(
                gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
    }
}
