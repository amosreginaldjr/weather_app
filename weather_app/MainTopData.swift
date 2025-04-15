//
//  MainTopData.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct MainTopData: View
{
    var city: String = "NULL CITY"
    var temperature: String = "NULL"
    var weatherIcon: String = "cloud.sun.fill" // <-- pass this in!

    var body: some View
    {
        VStack(alignment: .center, spacing: 10)
        {
            Text(city)
                .font(.system(size: 32, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.frame(width: 150, height: 160)
                .frame(width: 150, height: 160)
            
            Text(temperature)
                .font(.system(size: 40, weight: .medium, design: .monospaced))
                .foregroundColor(.white)
        }.padding(.top, 50)
    }
}
