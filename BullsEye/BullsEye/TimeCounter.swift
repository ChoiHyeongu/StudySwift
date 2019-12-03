//
//  TimeCounter.swift
//  BullsEye
//
//  Created by Choi on 2019/12/03.
//  Copyright © 2019 Choi. All rights reserved.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    var timer: Timer?
    @Published var counter = 0
    
    @objc func updateCounter(){
        counter += 1
    }
    
    init(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func killTime(){
        timer?.invalidate()
        timer = nil
    }
}
