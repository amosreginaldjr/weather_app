//
//  MainBackgroundColor.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct MainBackgroundColor: View
{
    @Environment(\.colorScheme) var colorScheme
    var isDay: Bool
    
    var body: some View
    {
        
        let gradientColors: [Color] = isDay ?
            [Color("LightBlue"), Color("DarkBlue")] :
            [Color("DarkBlue"), Color("LightBlue")]
            
        
        return LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
        
        
        
        
//        isDay ?
//        LinearGradient(
//            gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//        .edgesIgnoringSafeArea(.all)
//        :
//        LinearGradient(
//            gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//        .edgesIgnoringSafeArea(.all)
        
        
        
        
//            LinearGradient(
//                gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            .edgesIgnoringSafeArea(.all)
    }
}
