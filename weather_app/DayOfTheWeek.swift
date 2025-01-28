//
//  DayOfTheWeek.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

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
