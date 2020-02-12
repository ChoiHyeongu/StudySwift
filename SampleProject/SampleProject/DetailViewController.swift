//
//  DetailController.swift
//  SampleProject
//
//  Created by Choi on 2020/02/12.
//  Copyright © 2020 Choi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var webview: WKWebView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let urlString = "https://google.com"
    if let url = URL(string: urlString) {
      let urlReq = URLRequest(url: url)
      webview.load(urlReq)
    }
  }
}
