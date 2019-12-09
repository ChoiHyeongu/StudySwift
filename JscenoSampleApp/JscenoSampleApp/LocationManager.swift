//
//  LocationManager.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/12/05.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation
import CoreLocation
import Combine
import CoreGPX

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var trackInfos: [TrackInfo] = []
    @Published private(set) var location = CLLocation()
    @Published var isStart = true
    
    let gpxManager = GPXManager()
    
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    /*
    시작 및 종료 버튼 클릭
     */
    func statusButtonClicked(){
        if(isStart){
            isStart = false
            printGPXLocations()
            gpxManager.makeGPXFile(trackInfos: trackInfos)
        } else {
            isStart = true
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateLocations: [CLLocation]) {
        if(isStart){
            location = didUpdateLocations.last!
            let trackInfo = TrackInfo(coordinate: location.coordinate, elevation: location.altitude, speed: location.speed, time: Date())
            trackInfos.append(trackInfo)
        }
    }
    
    /*
     GPX출력하기
     */
    func printGPXLocations(){
        print ("---------------Start GPXLocations---------------")
        for location in trackInfos {
            print ("Coordinate : \(location.coordinate)")
            print ("Elevation : \(location.elevation)")
            print ("Speed : \(location.speed)")
            print ("Time : \(location.time)")
        }
        print ("---------------End GPXLocations Count : \(trackInfos.count)---------------")
    }
}
