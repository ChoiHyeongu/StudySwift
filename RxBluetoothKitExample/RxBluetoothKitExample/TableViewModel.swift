//
//  TableViewModel.swift
//  RxBluetoothKitExample
//
//  Created by Choi on 2020/02/28.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation
import RxBluetoothKit
import RxCocoa
import RxSwift

class TableViewModel {
  let bleScanner = BleScanner()
  var pairing: Disposable?

  var devices = BehaviorRelay<[ScannedPeripheral]>(value: [])

  init() {
    subscribeDeviceList()
  }

  func scanBle() {
    pairing?.dispose()
    _ = bleScanner.pair()
  }

  func subscribeDeviceList() {
    _ = bleScanner
      .deviceList
      .subscribe(onNext: {
        self.devices.accept($0)
      })
  }
}
