//
//  WeatherSpacer.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct WeatherSpacer: View
{
    //variables
    var characterToDisplay: String = "|"
    var size: CGFloat = 100
    var textWeight: Font.Weight? = .ultraLight
    var textDesign: Font.Design? = .default
    var frameWidth: CGFloat? = 10
    var frameHeight: CGFloat? = 80
    
    var body: some View
    {
        ZStack
        {
            Text(characterToDisplay)
                .font(.system(size: size,
                              weight: textWeight,
                              design: textDesign))
                .frame(width: frameWidth,
                       height: frameHeight)
        }
    }
}
