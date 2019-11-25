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
    @State var isStart = false
    @ObservedObject var locationObserver = LocationObserver()
    
    var body: some View {
        VStack {
            MapView(
                coordinate: self.locationObserver.location.coordinate,
                coordinates: self.locationObserver.coordinates,
                isStart: self.isStart
            ).frame(height: 500)
            
            Spacer()
                .frame(height: 32)
            Text("(\(self.locationObserver.location.coordinate.latitude), \(self.locationObserver.location.coordinate.longitude))")
            
            HStack{
                Button(action: {
                    print ("------------start--------------------")
                    self.isStart = true
                }) {
                    Text("Start")
                }
                Button(action: {
                    print ("------------stop--------------------")
                    self.isStart = false
                }) {
                    Text("Stop")
                }
            }
        }
    }
    
    func printCoordinates(){
        var cnt = 0
        for i in self.locationObserver.coordinates {
            print ("Content Coordinate : \(i.latitude), \(i.longitude)")
            cnt += 1
        }
        
        print ("Content END \(cnt)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
