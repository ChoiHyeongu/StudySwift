//
//  TrackInfo.swift
//  JscenoSampleApp
//
//  Created by Choi on 2019/12/05.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation
import CoreLocation

struct TrackInfo {
    var coordinate: CLLocationCoordinate2D
    var elevation: Double
    var speed: Double
    var time: Date

    init(coordinate: CLLocationCoordinate2D, elevation: Double, speed: Double, time: Date ){
        self.coordinate = coordinate
        self.elevation = elevation
        self.speed = speed
        self.time = time
    }
}
