//
//  GPXParser.swift
//  
//
//  Created by 최형우 on 2019/11/26.
//

import Foundation
import CoreGPX

class GPXParser {
    
    let gpxPath: String
    
    init(gpxPath: String) {
        self.gpxPath = gpxPath
    }
    
    func getGpx(){
        
        guard let gpx = GPXParser(withPath: self.gpxPath)?.parsedData() else { return }
        
        for waypoint in gpx.waypoints {
            print (waypoint.latitude!)
            print (waypoint.longitude!)
            print (waypoint.time!)
            print (waypoint.name!)
        }
    }
}
