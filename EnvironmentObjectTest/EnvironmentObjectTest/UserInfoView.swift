//
//  UserInfo.swift
//  EnvironmentObjectTest
//
//  Created by Choi on 2020/01/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct UserInfoView: View {
  @EnvironmentObject userInfo: UserInfo
  
  var body: some View {
    Text("Username \(userSettings.name)")
    Text("Age \(userSettings.age)")
    Text("Gender \(userSettings.gender)")
  }
}

struct UserInfo_Previews: PreviewProvider {
  static var previews: some View {
    UserInfoView()
  }
}
