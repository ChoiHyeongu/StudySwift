//
//  InputUser.swift
//  EnvironmentObjectTest
//
//  Created by Choi on 2020/01/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import SwiftUI

struct InputUserInfo: View {
  @EnvironmentObject var userInfo: UserInfo

  var body: some View {
    TextField("name", text: userInfo.$name)
    TextField("Age", text: userInfo.$age)
    TextField("Gender", text: userInfo.$gender)
  }
}

struct InputUserInfo_Previews: PreviewProvider {
  static var previews: some View {
    InputUser()
  }
}
