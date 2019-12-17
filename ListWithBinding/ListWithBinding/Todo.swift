//
//  Todo.swift
//  ListWithBinding
//
//  Created by Choi on 2019/12/17.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Foundation
import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool){
        self.title = title
        self.isDone = isDone
    }
}
