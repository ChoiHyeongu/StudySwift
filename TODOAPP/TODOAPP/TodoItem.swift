//
//  TodoItem.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/13.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct TodoItem: View {
    
    var todo: Todo
    
    init(todo: Todo){
        self.todo = todo
    }
    
    var body: some View {
        HStack{
            Text(self.todo.title)
                .font(.headline)
            Spacer()
            Button(action: {print("tab")}) {
                Image("star.fill")
            }
        }
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(todo: Todo(title: "", isDone: false))
            .frame(width: 300, height: 100, alignment: .center)
    }
}
