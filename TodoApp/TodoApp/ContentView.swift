//
//  ContentView.swift
//  TodoApp
//
//  Created by 최형우 on 2019/11/20.
//  Copyright © 2019 최형우. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = ["1", "2", "3"]
    @State var value = 1
    
    var body: some View {
        NavigationView {
            List{
                Button(action: {self.todos.append("value")}){
                Text("Add TODO")
                }
                ForEach(todos, id: \.self) { todo in
                    Text(todo)
                }
            }
            .navigationBarTitle("TODO")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
