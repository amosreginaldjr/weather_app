//
//  CircleButtons.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 3/6/25.
//

import Foundation

struct CircleButtons: View
{
    @Binding var isDay: Bool
    var buttonSize: CGFloat = 200
    
    var body: some View
    {
        Button (action: ) {
            
        }
        
        
        Button(action: {
            Task {
                fahrenheitCelsius.isFahrenheit.toggle()
                await fahrenheitCelsius.convertToFahrenheit() // Fetch and convert weather data
                temperature = fahrenheitCelsius.temperature
            }
        }) {
            Text(fahrenheitCelsius.isFahrenheit ? "Switch to Celsius" : "Switch to Fahrenheit")
                
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        
        
        
        
        
        
        
        
        
        
        
    }
}
