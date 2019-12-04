//
//  LocationObserver.swift
//  GPXMaker
//
//  Created by Choi on 2019/12/03.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation
import CoreLocation
import Combine
import CoreGPX

class LocationObserver: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var gpxLocations: [GPXLocation] = []
    @Published private(set) var location = CLLocation()
    @Published var isStart = true
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    //시작 및 종료 버튼 클릭
    func statusButtonClicked(){
        if(isStart){
            isStart = false
            printGPXLocations()
            makeGPXFile()
        } else {
            isStart = true
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateLocations: [CLLocation]) {
        if(isStart){
            location = didUpdateLocations.last!
            let gpxLocation = GPXLocation(coordinate: location.coordinate, elevation: location.altitude, speed: location.speed, time: Date())
            gpxLocations.append(gpxLocation)
        }
    }
    
    
    func printGPXLocations(){
        print ("---------------Start GPXLocations---------------")
        for location in gpxLocations {
            print ("Coordinate : \(location.coordinate)")
            print ("Elevation : \(location.elevation)")
            print ("Speed : \(location.speed)")
            print ("Time : \(location.time)")
        }
        print ("---------------End GPXLocations Count : \(gpxLocations.count)---------------")
    }
    
    func makeGPXFile(){
        let root = GPXRoot(creator: "GPXMaker")
        var trackpoints: [GPXTrackPoint] = []
        
        for location in gpxLocations {
            let coordinate = location.coordinate
            let trackpoint = GPXTrackPoint(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
            trackpoint.extensions = GPXExtensions()
            trackpoint.elevation = location.elevation
            trackpoint.time = location.time
            trackpoint.extensions?.append(at: nil, contents: ["speed" : String(location.speed)])
        
            trackpoints.append(trackpoint)
        }
        
        let track = GPXTrack()
        let tracksegment = GPXTrackSegment()
        
        tracksegment.add(trackpoints: trackpoints)
        track.add(trackSegment: tracksegment)
        root.add(track: track)
        
        print(root.gpx())
        
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
        do {
            try root.outputToFile(saveAt: url, fileName: "test")
            print (url)
        }
        catch {
            print(error)
        }
    }
}
