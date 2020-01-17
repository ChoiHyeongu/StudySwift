//
//  ContentView.swift
//  AlignmentGuide
//
//  Created by 이충경 on 2019/12/27.
//  Copyright © 2019 mintech. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .trailing) {  // relative to another subview in container (with siblings).
      LabelView(title: "Athos", color: .green)
        .alignmentGuide(HorizontalAlignment.leading, computeValue: { _ in 30 } )
        .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 30 } )
        .alignmentGuide(HorizontalAlignment.trailing, computeValue: { _ in 90 } )
      LabelView(title: "Porthos", color: .yellow)
        .alignmentGuide(HorizontalAlignment.leading, computeValue: { _ in 90 } )
        .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 30 } )
        .alignmentGuide(HorizontalAlignment.trailing, computeValue: { _ in 30 } )
      LabelView(title: "Aramis", color: .red)
      
    }.frame(width: 300, alignment: .leading)  // subviews group as a whole alignment inside the frame
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct LabelView: View {
  var title: String
  var color: Color

  var body: some View {
    Text(title)
      .padding()
      .background(color)
  }
}
