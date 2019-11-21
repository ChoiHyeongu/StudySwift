//
//  ContentView.swift
//  TodoApp
//
//  Created by 최형우 on 2019/11/20.
//  Copyright © 2019 최형우. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("To Do List")
                .font(.largeTitle)
                .foregroundColor(Color.purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
