//
//  RGBControllerScene.swift
//  NeoPixelController
//
//  Created by Choi on 2020/03/16.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct RGBControllerScene: View {
  @State var red: Double = 0
  @State var green: Double = 0
  @State var blue: Double = 0
  @State var white: Double = 255

  var body: some View {
    VStack {
      RGBInfoView

      Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: white / 255)
        .frame(width: 350, height: 350, alignment: .center)

      RGBSlider
    }
  }

  var RGBSlider: some View {
    VStack {
      Slider(value: $red, in: 0 ... 255, step: 1)
      Slider(value: $green, in: 0 ... 255, step: 1)
      Slider(value: $blue, in: 0 ... 255, step: 1)
      Slider(value: $white, in: 0 ... 255, step: 1)
    }
    .padding(10)
  }

  var RGBInfoView: some View {
    HStack {
      ColorValueView("R", red)
      ColorValueView("G", green)
      ColorValueView("B", blue)
      ColorValueView("W", white)
    }
  }

  func ColorValueView(_ type: String, _ value: Double) -> some View {
    HStack {
      Text("\(type) : \(Int(value))")
        .padding(3)
        .font(.system(size: 22, weight: .medium, design: .default))
    }
  }
}

struct RGBControllerScene_Previews: PreviewProvider {
  static var previews: some View {
    RGBControllerScene()
  }
}
