//
//  WeeklyForecastData.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 3/17/25.
//

import Foundation
import WeatherKit
import CoreLocation

class WeeklyForecastData: NSObject, CLLocationManagerDelegate, ObservableObject {
    var weatherService = WeatherService()
    @Published var daysOfTheWeek: [DayData] = [] // This should be published so UI updates

    override init() {
        super.init()
    }

    func fetchForecast(for location: CLLocation) {
        Task {
            do {
                let weather = try await weatherService.weather(for: location)
                let dailyForecasts = weather.dailyForecast.forecast
            
                // Ensure that you are running this on the main thread
                await MainActor.run {
                    self.daysOfTheWeek = dailyForecasts.map { daily in
                        DayData(
                            dayOfTheWeek: DateFormatter.localizedString(from: daily.date, dateStyle: .short, timeStyle: .none),
                            weatherIcon: daily.symbolName + ".fill",
                            temperature: "\(Int(daily.highTemperature.value))°"
                        )
                    }
                }
            } catch {
                print("Failed to fetch weather: \(error)")
            }
        }
    }
}
