//
//  MainTopData.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct MainTopData: View
{
    //variables
    var city: String = "NULL CITY"
    //var state: String = "NULL STATE"
    var temperature: String = "NULL"
    
    var body: some View
    {
        Text(city/* + ", " + state*/) //city, state
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
