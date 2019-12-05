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
    
    func getCoordinates(path: String) -> [CLLocationCoordinate2D]{
        let trackInfos = getTrackInfos(path: path)
        return trackInfos.map({$0.coordinate})
    }
}
