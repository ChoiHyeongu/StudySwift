//
//  User.swift
//  EnvironmentObjectTest
//
//  Created by Choi on 2020/01/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation

class UserInfo: ObservableObject {
  @Published var name: String = ""
  @Published var age: Int = 0
  @Published var gender: String = ""
}
