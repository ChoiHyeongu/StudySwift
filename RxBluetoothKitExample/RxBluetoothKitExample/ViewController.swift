//
//  ViewController.swift
//  RxBluetoothKitExample
//
//  Created by Choi on 2020/02/28.
//  Copyright © 2020 Choi. All rights reserved.
//

import RxBluetoothKit
import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
  @IBOutlet var tableview: UITableView!

  let tableViewModel = TableViewModel()
  let bleScanner = BleScanner()
  var pairing: Disposable?

  override func viewDidLoad() {
    configureTable()

    super.viewDidLoad()
  }

  func configureTable() {
    tableview.delegate = self
    tableview.dataSource = self

    let nibName = UINib(nibName: "BleTableViewCell", bundle: nil)
    tableview.register(nibName, forCellReuseIdentifier: "bleCell")

    _ = tableViewModel.devices
        .subscribe { self.tableview.reloadData() }

    tableViewModel.scanBle()
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewModel.devices.value.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "bleCell", for: indexPath) as! BleTableViewCell

    cell.bleTitleLabel.text = tableViewModel.devices.value[indexPath.row].peripheral.name ?? ""
    cell.signalLabel.text = "100"
    cell.bleTitleLabel.sizeToFit()

    return cell
  }
}
