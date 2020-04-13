//
//  ContentView.swift
//  LifeCycleTest
//
//  Created by Choi on 2020/04/12.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink(destination: SecondView()) {
          Text("Hello World")
        }
      }
    }.onAppear {
      print("View appear")
    }
  }
}

struct SecondView: View {
  var body: some View {
    VStack {
      Text("Second View")
    }.onAppear {
      print("SecondView appeared")
    }.onDisappear {
      print("SecondView disappeared")
    }
  }
}
