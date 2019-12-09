//
//  GPXManager.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/12/04.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation
import CoreGPX
import CoreLocation

class GPXManager {
    
    init(){}
    
    //GPX 파일에서 TrackInfo 배열을 반환
    func getTrackInfos(path: String) -> [TrackInfo]{
        let gpxFile = GPXParser(withPath: path)?.parsedData()!
        //let waypoints = gpxFile.waypoints
        let tracks = gpxFile!.tracks
        var trackInfos: [TrackInfo] = []
        
        for track in tracks {
            for tracksegment in track.tracksegments {
                for trackpoint in tracksegment.trackpoints {
                    let coordinate = CLLocationCoordinate2D(latitude: trackpoint.latitude!, longitude: trackpoint.longitude!)
                    let trackInfo = TrackInfo(coordinate: coordinate, elevation: trackpoint.elevation!, speed: 10.0, time: trackpoint.time!)
                    trackInfos.append(trackInfo)
                }
            }
        }
        return trackInfos
    }
    
    /*
     GPX파일을 통해 coordinates 반환
     */
    func getCoordinates(path: String) -> [CLLocationCoordinate2D]{
        let trackInfos = getTrackInfos(path: path)
        return trackInfos.map({$0.coordinate})
    }
    
    /*
    TrackInfos를 통해 coordinates 반환
    */
    func getCoordinates(trackInfos: [TrackInfo]) -> [CLLocationCoordinate2D]{
        return trackInfos.map({$0.coordinate})
    }
    
    /*
     GPX파일 만들기
     */
    func makeGPXFile(trackInfos: [TrackInfo]){
        let root = GPXRoot(creator: "GPXMaker")
        var trackpoints: [GPXTrackPoint] = []
        
        for location in trackInfos {
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
