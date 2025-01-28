//
//  DayNightButton.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct DayNightButton: View
{
    @Binding var isDay: Bool
    
    var body: some View
    {
        Button("Day Night"){
            isDay.toggle()
            if (isDay)
            {
                print("Daytime")
            }
            else
            {
                print("Nighttime")
            }
            //print(isDay)
        }
        .frame(width: 290, height: 60)
        .background(Color("MurkyBlue"))
        .scaledToFill()
        .cornerRadius(30)
        .padding(.bottom)
    }
}
