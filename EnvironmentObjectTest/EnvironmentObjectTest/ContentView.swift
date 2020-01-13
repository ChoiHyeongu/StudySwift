//
//  ContentView.swift
//  EnvironmentObjectTest
//
//  Created by Choi on 2020/01/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var userSettings: UserInfo
  
  
    var body: some View {
      VStack {
        if userSettings.name == userSettings.gender {
          InputUserInfo
        } else {
          
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
