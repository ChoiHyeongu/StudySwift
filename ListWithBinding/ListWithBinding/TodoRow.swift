//
//  TodoRow.swift
//  ListWithBinding
//
//  Created by Choi on 2019/12/17.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    
    @Binding var todo: Todo
    
    init(todo: Binding<Todo>){
        self._todo = todo
    }
    
    var body: some View {
        HStack {
            Text(todo.title)
                .strikethrough(todo.isDone)
            Spacer()
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    @State static var todo = Todo(title: "PreView", isDone: false)
    static var previews: some View {
        TodoRow(todo: $todo)
    }
}
