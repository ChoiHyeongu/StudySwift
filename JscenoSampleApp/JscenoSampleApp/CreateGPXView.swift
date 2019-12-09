//
//  CreateGPXView.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/12/05.
//  Copyright © 2019 Choi. All rights reserved.
//

import SwiftUI

struct CreateGPXView: View {
    
    @ObservedObject var locationManager = LocationManager()
    var gpxManager = GPXManager()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            MapView(mode: true, coordinates: gpxManager.getCoordinates(trackInfos: locationManager.trackInfos),coordinate:locationManager.location.coordinate).edgesIgnoringSafeArea(.all)
            
            Button(action: {self.locationManager.statusButtonClicked()}) {
                Text(!self.locationManager.isStart ? "Start" : "Stop")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(40)
                    .foregroundColor(Color.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.red, lineWidth: 5.0)
                )
            }.position(x: screenSize.width/2, y: screenSize.height-230)
        }
    }
}

struct CreateGPXView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGPXView()
    }
}
