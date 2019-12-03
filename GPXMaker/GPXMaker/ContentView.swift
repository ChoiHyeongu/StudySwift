//
//  ContentView.swift
//  GPXMaker
//
//  Created by Choi on 2019/12/03.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationObserver = LocationObserver()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            MapView(coordinate: locationObserver.location.coordinate, gpxLocations: locationObserver.gpxLocations, isStart:  locationObserver.isStart).edgesIgnoringSafeArea(.all)
            
            Button(action: {self.locationObserver.statusButtonClicked()}) {
                Text(!self.locationObserver.isStart ? "Start" : "Stop")
                    .fontWeight(.bold)
                    .padding()
                    .font(.title)
                    .background(Color.red)
                    .cornerRadius(40)
                    .foregroundColor(Color.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.red, lineWidth: 5)
                )
                
                
                
            }.position(x: screenSize.width/2, y: screenSize.height-100)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
