//
//  ContentView.swift
//  PKHUDTest
//
//  Created by Choi on 2020/01/10.
//  Copyright © 2020 Choi. All rights reserved.
//

import PKHUD
import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello, World!")
      .onAppear {
        HUD.flash(.progress, delay: 1.0) { finished in
          HUD.flash(.success, delay: 1.0) { finished in
            HUD.flash(.error ,delay: 1.0)
          }
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
