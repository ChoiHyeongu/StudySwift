//
//  LocationObserver.swift
//  LocationObserverMap
//
//  Created by Choi on 2019/11/23.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation
import CoreLocation
import Combine
import CoreGPX

class LocationObserver: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published private(set) var location = CLLocation()
    @Published var coordinates: [CLLocationCoordinate2D] = []
    @Published var isStart = true
    let path = URL(string: "Users/motivation")
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    func toggleIsStart(){
        if(isStart){
            isStart = false
            makeGPXFile()
        } else {
            isStart = true
        }
        print (isStart)
    }
    
    func locationManager(_: CLLocationManager, didUpdateLocations: [CLLocation]) {
        if(isStart){
            location = didUpdateLocations.last!
            self.coordinates.append(location.coordinate)
            print ("Coordinates Updating")
        }
    }
    
    func makeGPXFile(){
        let root = GPXRoot(creator: "LocationObserverMap")
        var trackpoints: [GPXTrackPoint] = []
        for coordinate in coordinates {
            let trackpoint = GPXTrackPoint(latitude: coordinate.latitude, longitude: coordinate.longitude)
            trackpoint.elevation = 10
            trackpoint.time = Date()
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
