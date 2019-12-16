//
//  ContentView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/13.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    
    @State var showPopover = false
    @State var todos = [
        Todo(title: "Study SwiftUI, Combine", isDone: true),
        Todo(title: "Solve Jsceno Issue #33", isDone: false),
        Todo(title: "Write TIL before off work", isDone: false),
        Todo(title: "Buy Kotlin with Functional programming", isDone: true),
        Todo(title: "Remove Visual Studio Code", isDone: false),
    ]
    
    var body: some View {
        NavigationView {
            List(todos.indices){ index in
                NavigationLink(destination: DetailView(todo: self.$todos[index])){
                    TodoRow(todo: self.$todos[index])
                }
            }
            .navigationBarTitle("오늘 할 일")
            .navigationBarItems(trailing: Button(action: {self.didTapAddButton()}) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .popover(isPresented: $showPopover, arrowEdge: .bottom){
                        TodoInputView()
                }
            })
        }
    }
    
    func didTapAddButton(){
        showPopover = !showPopover ? true : false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
