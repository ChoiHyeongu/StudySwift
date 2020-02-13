//
//  Todo.swift
//  XibTODO
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import Foundation

struct Todo {
  /// 제목
  var title: String
  /// 기간
  var dueDate: Date?
  /// 마일스톤
  var mileStone: Milestone?
  /// 카테고리
  var category: Category?
}
