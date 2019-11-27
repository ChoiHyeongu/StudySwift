//
//  ContentView.swift
//  GpxParserTest
//
//  Created by 최형우 on 2019/11/26.
//  Copyright © 2019 최형우. All rights reserved.
//

import SwiftUI
import CoreGPX
import CoreLocation

struct ContentView: View {
    
    let gpx = GPXParser(withPath: "/Users/motivation/StudySwift/GpxParserTest/GpxParserTest/gapa.gpx")?.parsedData()
    
    @State var tracks = [GPXTrack]()
    @State var waypoints = [GPXWaypoint]()
    @State var speeds = [GPXExtensionsElement]()
    @State var coordinates = [CLLocationCoordinate2D]()
    @State var isStart: Bool
    
    var body: some View {
        VStack{
            if(isStart){MapView(coordinates: self.coordinates)}
            Button(action: {
                print ("Button Clicked")
                self.tracks = self.gpx!.tracks
                self.waypoints = self.gpx!.waypoints

                print (self.waypoints.count)
                print (self.tracks.count)
            
                for waypoint in self.waypoints {
                    print("MapData waypoint-latitude: \(waypoint.latitude ?? 0)")
                    print("MapData waypoint-longitude: \(waypoint.longitude ?? 0)")
                    print("MapData waypoint-date: \(waypoint.time ?? Date())")
                }
                
                for track in self.tracks {
                    for tracksegment in track.tracksegments {
                        for trackpoint in tracksegment.trackpoints {
                            let speed = trackpoint.extensions!["gpx10:speed"]
                            print("MapData speed: \(String(describing: speed.text))")
                            print("MapData trackpoint-latitude: \(trackpoint.latitude ?? 0)")
                            print("MapData trackpoint-longitude: \(trackpoint.longitude ?? 0)")
                            print("MapData trackpoint-date: \(trackpoint.time ?? Date())")
                            print("======================================================")
                            self.coordinates.append(CLLocationCoordinate2D(latitude: trackpoint.latitude!, longitude: trackpoint.longitude!))
                        }
                    }
                }
                
                self.isStart = true
                print (self.coordinates.count)
            }) {
            Text("Parsing")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isStart: false)
    }
}
