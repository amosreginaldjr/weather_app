//
//  LaunchScreen.swift
//  weather_app
//
<<<<<<< HEAD
//  Created by Amos Reginald Jr. on 2/2/25.
//
//https://www.youtube.com/watch?v=0ytO3wCRKZU

import SwiftUI

struct LaunchScreenView: View
{
    @State private var isActive: Bool = false
    @State private var size: Float = 0.8
    @State private var opacity: Float = 0.5
    
    //look into symbol effect -- replace
    var body: some View
    {
        
        if (isActive)
        {
            ContentView()
        }
        else {
            
            VStack
            {
                VStack
                {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 80))
                        .symbolRenderingMode(.multicolor)
                    Text("Weather")
                        .font(.system(size: 30))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(CGFloat(size))
                .opacity(CGFloat(opacity))
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}


struct LaunchScreenViewPreview: PreviewProvider
{
    static var previews: some View
    {
        LaunchScreenView()
=======
//  Created by Amos Reginald Jr. on 1/30/25.
//

import UIKit

class UIView : UIViewController
{
    override func viewDidLoad()
    {
        //super.performSelector(onMainThread: #selector(UIWindowController.setNeedsStatusBarAppearanceUpdate), withObject: nil, waitUntilDone: false)
        
        view.backgroundColor = .cyan
        //let myView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
>>>>>>> main
    }
}
