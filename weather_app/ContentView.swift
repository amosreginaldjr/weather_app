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
            //the sub box for the days in the middle
            Image(systemName: "rectangle.fill")
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundColor(Color("SubtleBlue"))
                .frame(width: 370, height: 200)
                .aspectRatio(contentMode: .fill)
                .blur(radius: 7)
                
            LinearGradient(
                gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
        
            VStack
            {
                //city and state
                Text("Staten Island, NY") //city, state
                    .font(.system(size: 32, weight: .semibold, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
                
                //weather icon and temperature
                VStack(alignment: .center, spacing: 10)
                {
                    Image(systemName: "sun.rain.fill")
                        .renderingMode(.original)//.symbolRenderingMode(.multicolor)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 160)
                    
                    Text("65°")
                        .font(.system(size: 40, weight: .medium, design: .monospaced))
                        .foregroundColor(.white)
                }
                //Spacer() //when i have this it brings things closer together, why?
                
                
                
                ZStack()
                {
                    HStack(spacing: 15)
                    {
                        //monday
                        VStack
                        {
                            //day of week
                            Text("Mon")
                                .foregroundColor(.white)
                            //icon
                            Image(systemName: "sun.max.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .aspectRatio(contentMode: .fit)
                            
                            
                            //temperature
                            Text("65°")
                                .font(.system(size: 29, weight: .medium, design: .monospaced))
                                .foregroundColor(.white)
                        }
                        
                        //spacer
                        ZStack
                        {
                            Text("|")
                                .font(.system(size: 100, weight: .ultraLight, design: .default))
                                .frame(width: 10, height: 80)
                        }
                        
                        //tuesday
                        VStack
                        {
                            Text("Tue")
                                .foregroundColor(.white)
                            
                            Image(systemName: "sun.snow.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .aspectRatio(contentMode: .fit)
                            
                            
                            Text("97°")
                                .font(.system(size: 30, weight: .medium, design: .monospaced))
                                .foregroundColor(.white)
                        }
                        
                        //spacer
                        ZStack
                        {
                            Text("|")
                                .font(.system(size: 100, weight: .ultraLight, design: .default))
                                .frame(width: 10, height: 80)
                        }
                        
                        //wednesday
                        VStack
                        {
                            Text("Wed")
                                .foregroundColor(.white)
                            
                            Image(systemName: "sun.haze.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .aspectRatio(contentMode: .fit)
                            
                            Text("23°")
                                .font(.system(size: 30, weight: .medium, design: .monospaced))
                                .foregroundColor(.white)
                        }
                        
                        //spacer
//                        ZStack
//                        {
//                            Text("|")
//                                .font(.system(size: 100, weight: .ultraLight, design: .default))
//                                .frame(width: 10, height: 80)
//                        }
                        
                        //IMPLIMENT FOR THE REMAINING DAYS!!!!!
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
