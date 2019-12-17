//
//  ContentView.swift
//  ListWithBinding
//
//  Created by Choi on 2019/12/17.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Study SwiftUI, Combine", isDone: true),
        Todo(title: "Solve Jsceno Issue #33", isDone: false),
        Todo(title: "Write TIL before off work", isDone: false),
        Todo(title: "Buy Kotlin with Functional programming", isDone: true),
        Todo(title: "Remove Visual Studio Code", isDone: false),
    ]
    
    var body: some View {
        List(todos) { item in
            Text(item.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
