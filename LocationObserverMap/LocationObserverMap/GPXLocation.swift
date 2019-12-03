//
//  GPXLocation.swift
//  LocationObserverMap
//
//  Created by Choi on 2019/12/03.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

struct GPXLocation {
    var coordinate: CLLocationCoordinate2D
    var elevation: Double
    var speed: Double = 0.0
    var time: Date
    
    init(coordinate: CLLocationCoordinate2D, elevation: Double, speed: Double, time: Date ){
        self.coordinate = coordinate
        self.elevation = elevation
        self.speed = speed
        self.time = time
    }
}
