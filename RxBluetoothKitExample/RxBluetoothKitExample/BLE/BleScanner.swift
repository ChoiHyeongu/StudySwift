//
//  BleScanner.swift
//  RxBluetoothKitExample
//
//  Created by Choi on 2020/02/28.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation
import RxBluetoothKit
import RxCocoa
import RxSwift

class BleScanner {
  let timeout = RxTimeInterval.seconds(10000)
  let manager = CentralManager(queue: .main)
  var deviceList = BehaviorRelay<[ScannedPeripheral]>(value: [])
  var pairStep = BehaviorRelay<PairingStep>(value: .none)

  func pair() {
    _ = waitForBluetooth(pairStep)
      .flatMap { _ in self.scanForPeripheral(self.pairStep) }
  }

  private func waitForBluetooth(_ progress: BehaviorRelay<PairingStep>) -> Observable<BluetoothState> {
    progress.accept(.waitingForBluetooth)
    return manager
      .observeState()
      .startWith(manager.state)
      .filter { $0 == .poweredOn }
      .take(1)
  }

  // Step 2. Scan
  private func scanForPeripheral(_ progress: BehaviorRelay<PairingStep>) -> Observable<ScannedPeripheral> {
    progress.accept(.scanning)
    return manager
      .scanForPeripherals(withServices: nil)
      .take(1)
      .timeoutIfNoEvent(timeout)
      .do(onNext: {
        progress.accept(.peripheralDiscovered(peripheral: $0.peripheral.name ?? ""))
      })
  }

  // Step 3. Connect
  private func connect(to peripheral: ScannedPeripheral, progress: AnyObserver<PairingStep>) -> Observable<Peripheral> {
    progress.onNext(.connecting)
    return peripheral.peripheral
      .establishConnection()
      .timeoutIfNoEvent(timeout)
      .do(onNext: { _ in progress.onNext(.connected) })
  }

  // Step 4. Receive initial data
  private func getData(from peripheral: Peripheral, progress: AnyObserver<PairingStep>) -> Observable<Characteristic> {
    progress.onNext(.receivingInitialData)

    let notifications = peripheral.observeValueUpdateAndSetNotification(for: Characteristics.batteryLevel)
    let readValue = peripheral.readValue(for: Characteristics.batteryLevel)

    return Observable.concat(readValue.asObservable(), notifications.skip(1))
  }

  func addScannedPeripheral(_ device: ScannedPeripheral) {
    deviceList.accept(deviceList.value + [device])
  }
}
