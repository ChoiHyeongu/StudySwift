//
//  ViewController.swift
//  SampleProject
//
//  Created by Choi on 2020/02/12.
//  Copyright © 2020 Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func clickMoveButton(_ sender: Any) {
    if let controller = self.storyboard?.instantiateViewController(identifier: "DetailViewController") {
      self.navigationController?.pushViewController(controller, animated: true)
    }
  }
}
