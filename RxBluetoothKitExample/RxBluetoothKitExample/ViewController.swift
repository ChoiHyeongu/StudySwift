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
  @IBOutlet weak var reButton: UIButton!
  @IBOutlet weak var signalButton: UIButton!
  
  let viewmodel = ViewModel()
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewModel()
    viewmodel.startScan()
  }
  
  func configureViewModel() {
    reButton
    .rx
    .tap
    .bind(onNext: {
      self.viewmodel.connect()
    })
    .disposed(by: disposeBag)
    
    signalButton
    .rx
    .tap
    .bind(onNext: {
      self.viewmodel.writeSingal()
    })
    .disposed(by: disposeBag)
  }
}
