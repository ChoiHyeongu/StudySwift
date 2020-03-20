//
//  ContentView.swift
//  NeoPixelController
//
//  Created by Choi on 2020/03/16.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var currentScreen: Scene = .controller

  var body: some View {
    Group {
      ContainView()
    }
  }

  func ContainView() -> AnyView {
    switch currentScreen {
    case .controller: return AnyView(RGBControllerScene(currentScene: self.$currentScreen))
    case .list: return AnyView(RGBListScene(currentScene: self.$currentScreen))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
