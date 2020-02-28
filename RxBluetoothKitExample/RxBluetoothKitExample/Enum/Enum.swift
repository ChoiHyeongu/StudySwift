//
//  Enum.swift
//  RxBluetoothKitExample
//
//  Created by Choi on 2020/02/28.
//  Copyright © 2020 Choi. All rights reserved.
//
import RxBluetoothKit
import RxCocoa
import RxSwift
import CoreBluetooth


enum PairingStep {
    case none
    case waitingForBluetooth
    case scanning
    case peripheralDiscovered(peripheral: String)
    case connecting
    case connected
    case receivingInitialData
    case paired
}

enum Services: ServiceIdentifier {
    case battery
    
    var uuid: CBUUID { return CBUUID(string: "180F") }
}
 
enum Characteristics: CharacteristicIdentifier {
    case batteryLevel
    
    var uuid: CBUUID { return CBUUID(string: "2A19") }
    var service: ServiceIdentifier { return Services.battery }
}
