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
    @State private var scale: CGFloat = 1.0
    @State private var isTapped = false
    
    var body: some View
    {
        Button(action: {
            withAnimation(.spring()) {
            isTapped.toggle()
        }
            Task {
                fahrenheitCelsius.isFahrenheit.toggle()
                await fahrenheitCelsius.convertToFahrenheit()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring()) {
                    isTapped = false
                }
            }
        }) {
            Text(fahrenheitCelsius.isFahrenheit ? "F°" : "C°")
                .padding()
                .font(.system(size: 40, weight: .medium, design: .default))
                //.background(Color("ButtonCFDarker"))
                .controlSize(.extraLarge).frame(width: 80, height: 80)
                .background(Gradient(colors: [Color("ButtonCFLighter"), Color("ButtonCFDarker")]))
                .foregroundColor(.black)
                .cornerRadius(10)
                .clipShape(Circle())
        }
        .scaleEffect(isTapped ? 1.2 : 1.0)
        //.animateUserTap()
    }
}
