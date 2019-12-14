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
        Todo(title: "SwiftUI Combine 공부하기", isDone: false),
        Todo(title: "SwiftUI Combine 공부하기", isDone: false),
        Todo(title: "SwiftUI Combine 공부하기", isDone: false),
        Todo(title: "SwiftUI Combine 공부하기", isDone: false),
    ]
    
    var body: some View {
        NavigationView {
            List(todos, id:\.title){ todo in
                NavigationLink(destination: DetailView()){
                    TodoItem(todo: todo)
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
