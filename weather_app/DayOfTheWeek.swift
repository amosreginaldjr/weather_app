//
//  DayOfTheWeek.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct DayOfTheWeek: View
{
    //day of week
    var dayOfTheWeek: String = "NULL"
    
    //icon
    var weatherIcon: String = "sun.max.fill"
    var imageWidthHeight: CGFloat = 60
    
    //temperature
    var temperature: String = "NULL"
    
    var body: some View
    {
        VStack
        {
            //day of week
            Text(dayOfTheWeek)
                .foregroundColor(.white)
            
            //icon
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .frame(width: imageWidthHeight, height: imageWidthHeight)
                .aspectRatio(contentMode: .fit)
            
            //temperature
            Text(temperature)
                .font(.system(size: 29, weight: .medium, design: .monospaced))
                .foregroundColor(.white)
        }
    }
}
