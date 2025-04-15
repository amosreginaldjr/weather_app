//
//  DaysOfTheWeekCenterScreen.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 2/10/25.
//
//https://stackoverflow.com/questions/25533147/get-day-of-week-using-nsdate

import SwiftUI

struct DaysOfTheWeekCenterScreen: View {
    @ObservedObject var forecastData: WeeklyForecastData
    @StateObject var fahrenheitCelsius = ConvertFahrenheitToCelsius()
    
    // Helper to convert "MM/dd/yy" to full weekday name
    func getDayOfWeek(_ today: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        
        guard let todayDate = formatter.date(from: today) else { return nil }
        
        formatter.dateFormat = "EEEE" // full weekday like "Monday"
        return formatter.string(from: todayDate)
    }
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(forecastData.daysOfTheWeek, id: \.dayOfTheWeek) { day in
                DayOfTheWeek(
                    dayOfTheWeek: getDayOfWeek(day.dayOfTheWeek) ?? "Unknown",
                    weatherIcon: day.weatherIcon,
                    temperature: day.temperature
                )
            }
        }
    }
}
