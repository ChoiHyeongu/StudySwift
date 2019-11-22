//
//  Todo.swift
//  TodoApp
//
//  Created by Choi on 2019/11/21.
//  Copyright © 2019 최형우. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var title = "Untitled"
    @Published var isDone = false
}
