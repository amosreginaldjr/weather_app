//
//  BluredBackground.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 1/27/25.
//

import SwiftUI

struct BluredBackground: View
{
    //variables
    
    var body: some View
    {
//        //the sub box for the days in the middle
//        Image(systemName: "rectangle.fill")
//            .symbolRenderingMode(.palette)
//            .resizable()
//            .foregroundColor(Color("SubtleBlue"))
//            .frame(width: 370, height: 200)
//            .aspectRatio(contentMode: .fill)
//            .blur(radius: 7)
//            //.shadow(color: .black, radius: 20)
        
        
        //the sub box for the days in the middle
        Image(systemName: "rectangle.fill")
            .symbolRenderingMode(.palette)
            .resizable()
            .foregroundColor(Color("SubtleBlue"))
            .frame(width: 400, height: 170)
            .aspectRatio(contentMode: .fill)
            .offset(x: 0, y: -10)
            .blur(radius: 7)
            //.shadow(color: .black, radius: 20)
    }
    
}
