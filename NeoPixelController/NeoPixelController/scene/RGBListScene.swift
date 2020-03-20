//
//  RGBListScene.swift
//  NeoPixelController
//
//  Created by Choi on 2020/03/17.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct RGBListScene: View {
  @Binding var currentScene: Scene
  
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RGBListScene_Previews: PreviewProvider {
    static var previews: some View {
      RGBListScene(currentScene: .constant(.list))
    }
}
