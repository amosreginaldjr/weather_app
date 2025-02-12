//
//  DaysOfTheWeekCenterScreen.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 2/10/25.
//

import SwiftUI

struct DaysOfTheWeekCenterScreen: View
{
    var daysOfTheWeek: [DayOfTheWeek] = []
    
    var body: some View
    {
        HStack(spacing: 15)
        {
            ForEach(daysOfTheWeek, id: \.dayOfTheWeek) { day in
                DayOfTheWeek(dayOfTheWeek: day.dayOfTheWeek,
                             weatherIcon: day.weatherIcon,
                             temperature: day.temperature)
                WeatherSpacer()
            }
        }
    }
}

