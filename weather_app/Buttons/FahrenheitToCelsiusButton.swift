//
//  FahrenheitToCelsiusButton.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 3/6/25.
//

import SwiftUI

struct FahrenheitToCelsiusButton: View
{
    @ObservedObject var fahrenheitCelsius: ConvertFahrenheitToCelsius
    
    var body: some View
    {
        Button(action: {
            Task {
                fahrenheitCelsius.isFahrenheit.toggle()
                await fahrenheitCelsius.convertToFahrenheit()
            }
        }) {
            Text(fahrenheitCelsius.isFahrenheit ? "F°" : "C°")
                .padding()
                //.background(Color("ButtonCFDarker"))
                .background(Gradient(colors: [Color("ButtonCFLighter"), Color("ButtonCFDarker")]))
                .foregroundColor(.black)
                .cornerRadius(10)
                .clipShape(Circle())
        }
    }
}
