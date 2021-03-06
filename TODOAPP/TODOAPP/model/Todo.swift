//
//  Todo.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/13.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Foundation
import SwiftUI

struct Todo {
    //var id = UUID()
    var title: String
    var isDone: Bool
    var label: Label = .none
    var memo: String = ""
    
    init(title: String, isDone: Bool){
        self.title = title
        self.isDone = isDone
    }
}
