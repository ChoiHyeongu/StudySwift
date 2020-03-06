//
//  WelcomeScene.swift
//  DailyCommit
//
//  Created by Choi on 2020/03/06.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct WelcomeScene: View {
    var body: some View {
      VStack {
        TitleView
        SettingButton
      }
    }

    var TitleView: some View {
      Text("Daily Commit!")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding(.bottom, 350)
    }

    var SettingButton: some View {
      Button(action: { print("Setting Clicked") }) {
        Text("Start!")
          .fontWeight(.medium)
          .font(.title)
      }
    }
}

struct WelcomeScene_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScene()
    }
}
