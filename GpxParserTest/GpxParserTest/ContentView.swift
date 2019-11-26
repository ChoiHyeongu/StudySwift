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
    
    let gpx = GPXParser(withPath: "/Users/choihyeongu/StudySwift/GpxParserTest/GpxParserTest/gapa.gpx")?.parsedData()
    
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
                    print("waypoint-latitude: \(waypoint.latitude ?? 0)")
                    print("waypoint-longitude: \(waypoint.longitude ?? 0)")
                    print("waypoint-date: \(waypoint.time ?? Date())")
                }
                
                for track in self.tracks {
                    for tracksegment in track.tracksegments {
                        for trackpoint in tracksegment.trackpoints {
                            var speed = trackpoint.extensions!["gpx10:speed"]
                            print("speed: \(speed)")
                            print("speed: \(speed.gpx())")
                            print("speed: \(speed.children.endIndex)")
                            print("speed: \(speed.name)")
                            print("speed: \(speed)")
//                            print("trackpoint-latitude: \(trackpoint.latitude ?? 0)")
//                            print("trackpoint-longitude: \(trackpoint.longitude ?? 0)")
//                            print("trackpoint-date: \(trackpoint.time ?? Date())")
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
