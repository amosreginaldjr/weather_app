//
//  MainBackgroundColor.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct MainBackgroundColor: View
{
    @Binding var isDay: Bool
    
    var body: some View
    {
//        if (isDay)
//        {
//            LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"),                                                             Color("LightBlue")]),
//                             startPoint: .topLeading,
//                             endPoint: .bottomTrailing)
//            .edgesIgnoringSafeArea(.all)
//        }
//        else
//        {
//            LinearGradient(gradient: Gradient(colors: [Color("LightBlue"),                                                 Color("DarkBlue")]),
//                   startPoint: .topLeading,
//                   endPoint: .bottomTrailing)
//            .edgesIgnoringSafeArea(.all)
//        }
        
      
            LinearGradient(
                gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
    }
}
