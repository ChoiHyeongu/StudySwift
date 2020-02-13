//
//  Milestone.swift
//  XibTODO
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation

/// 마일스톤
enum Milestone: String {
  
  // 급함
  case urgent = "Urgent"
  // 어떤 일 이후 해야하는 일
  case after = "After"
  // 어떤 일 전에 해야하는 일
  case before = "Before"
  // 기간이 있음
  case due = "Due"
  // 아무것도아님
  case none = "None"
}
