//
//  RGBControllerScene.swift
//  NeoPixelController
//
//  Created by Choi on 2020/03/16.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct RGBControllerScene: View {
  @Binding var currentScene: Scene
  @State var red: Double = 0
  @State var green: Double = 0
  @State var blue: Double = 0
  @State var white: Double = 255

  var body: some View {
    VStack {
      Header
      Spacer().frame(width: 1, height: 80, alignment: .center)
      RGBInfoView

      Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: white / 255)
        .frame(width: 250, height: 250, alignment: .center)

      RGBSlider

      SaveButton
    }
  }

  var Header: some View {
    HStack {
      Button(action: { self.currentScene = .list }) {
        Text("List")
      }
      .padding(.leading, 10)

      Spacer()

      Button(action: { self.currentScene = .controller }) {
        Text("Pattern")
      }
      .padding(.trailing, 10)
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

  var SaveButton: some View {
    Button(action: {
      print("Save")
    }) {
      Text("Save")
    }
    .padding(.bottom, 25)
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
    RGBControllerScene(currentScene: .constant(.controller))
  }
}
