//
//  ContentView.swift
//  LocationObserverMap
//
//  Created by Choi on 2019/11/23.
//  Copyright © 2019 Choi. All rights reserved.
//
import SwiftUI
import CoreLocation

struct ContentView: View {
    @State var isStart = true
    @ObservedObject var locationObserver = LocationObserver()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            MapView(
                coordinate: self.locationObserver.location.coordinate,
                coordinates: self.locationObserver.coordinates,
                isStart: self.isStart
            ).edgesIgnoringSafeArea(.all)
            
            Button(action: {
                if self.isStart {
                    self.isStart = false
                } else {
                    self.isStart = true
                }
            }) {
                Text(!self.isStart ? "Start" : "Stop")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
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

