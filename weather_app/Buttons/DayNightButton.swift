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
    @State private var scale: CGFloat = 1.0
    @State private var isTapped = false
    
    var body: some View
    {
        Button (action: {
            withAnimation(.spring()){
                isTapped.toggle()
            }
            isDay.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring()) {
                    isTapped = false
                }
            }
        })
        {
            Text(isDay ? (Image(systemName: "sun.max")) : (Image(systemName: "moon.stars")))
                .padding()
                .font(.system(size: 40, weight: .medium, design: .default))
                .controlSize(.extraLarge).frame(width: 80, height: 80)
                .background(Gradient(colors: [Color("ButtonCFLighter"), Color("ButtonCFDarker")])) //CHANGE COLORS?
                .foregroundColor(.black)
                .cornerRadius(10)
                .clipShape(Circle())
        }
        .scaleEffect(isTapped ? 1.2 : 1.0)
        //REMOVE FADE ANIMATION WHEN BUTTON TAPPED
        
        
        
        
//        Button("Day Night"){
//            isDay.toggle()
//            if (isDay)
//            {
//                print("Daytime")
//            }
//            else
//            {
//                print("Nighttime")
//            }
//            //print(isDay)
//        }
//        .frame(width: 290, height: 60)
//        .background(Color("MurkyBlue"))
//        .scaledToFill()
//        .cornerRadius(30)
//        .padding(.bottom)
    }
}
