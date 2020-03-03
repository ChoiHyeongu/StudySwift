//
//  TableViewModel.swift
//  RxBluetoothKitExample
//
//  Created by Choi on 2020/02/28.
//  Copyright © 2020 Choi. All rights reserved.
//

import CoreBluetooth
import Foundation
import RxCocoa
import RxSwift

class ViewModel: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
  var centralManager: CBCentralManager!
  var zetPeripheral: CBPeripheral?
  var serial: String = "GA19280020"

  private var state = BehaviorRelay<CBManagerState>(value: .unknown)
  private var disposeBag = DisposeBag()
  private var rxCharacteristicUuid: CBCharacteristic?
  private var txCharacteristicUuid: CBCharacteristic?

  override init() {
    super.init()
    centralManager = CBCentralManager(delegate: self, queue: nil)

    state
      .asObservable()
      .subscribe(onNext: {
        if $0 == .poweredOn {
          self.centralManager.scanForPeripherals(withServices: nil)
        }
      })
      .disposed(by: disposeBag)
  }

  func startScan() {
    centralManager.scanForPeripherals(withServices: nil, options: nil)
  }

  func writeSingal() {
    let signal = "3"
    zetPeripheral?.writeValue(signal.data(using: .utf8)!, for: rxCharacteristicUuid!, type: .withResponse)
    zetPeripheral!.readValue(for: txCharacteristicUuid!)
  }

  func connect() {
    guard zetPeripheral != nil else { return }

    if removeTag(zetPeripheral!.name!) == serial {
      centralManager.connect(zetPeripheral!, options: nil)
    }
  }

  func isZETDevice(_ peripherals: CBPeripheral) -> Bool {
    guard peripherals.name != nil else { return false }
    if removeTag(peripherals.name!) == serial {
      return true
    }
    return false
  }

  func removeTag(_ string: String) -> String {
    return String(string.filter { !" \n\t\r".contains($0) })
  }

  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch central.state {
    case .unknown:
      print("central.state is .unknown")
    case .resetting:
      print("central.state is .resetting")
    case .unsupported:
      print("central.state is .unsupported")
    case .unauthorized:
      print("central.state is .unauthorized")
    case .poweredOff:
      print("central.state is .poweredOff")
    case .poweredOn:
      print("central.state is .poweredOn")
    default:
      print("central.state is default")
    }

    state.accept(central.state)
  }

  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                      advertisementData: [String: Any], rssi RSSI: NSNumber) {
    if isZETDevice(peripheral) {
      print(peripheral)
      zetPeripheral = peripheral
      zetPeripheral!.delegate = self
    }
  }

  func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
    print("\(String(describing: zetPeripheral?.name)) is Connected!")
    zetPeripheral!.discoverServices(nil)
  }

  func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
    if let error = error {
      print("error: \(error)")
      return
    }
    let services = peripheral.services
    peripheral.discoverCharacteristics(nil, for: (services?.first)!)
  }

  func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService,
                  error: Error?) {
    guard let characteristics = service.characteristics else { return }
    txCharacteristicUuid = characteristics.first
    rxCharacteristicUuid = characteristics.last

    print(txCharacteristicUuid!)
    print(rxCharacteristicUuid!)
  }

  func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
    if error != nil {
      print("error: \(String(describing: error))")
      return
    }
    print(characteristic.description)
    print("Succeeded!")
    zetPeripheral!.setNotifyValue(true, for: txCharacteristicUuid!)
  }

  func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
    if let error = error {
      print("error: \(error)")
      return
    }

    print("characteristic UUID: \(characteristic.uuid), value: \(String(decoding: characteristic.value!, as: UTF8.self))")
  }
}
