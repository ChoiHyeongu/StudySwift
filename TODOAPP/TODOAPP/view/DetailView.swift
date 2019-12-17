//
//  DetailView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/16.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var todo: Todo
    
    init(todo: Binding<Todo>) { self._todo = todo }
    
    var body: some View {
        VStack(alignment: .leading){
            TextField("Enter the TODO title", text:$todo.title)
                .font(.system(size: 25, weight: .heavy))
            Divider()
            Text("Label")
                .font(.system(size: 20, weight: .regular))
            LabelList
            Text("Memo")
            TextField("Enter some memo here", text: $todo.memo)
            Spacer()
        }
        .padding(.leading, 5)
    }
    
    var LabelList: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack{
                LabelView(name: .important, todo: $todo)
                LabelView(name: .optional, todo: $todo)
                LabelView(name: .time, todo: $todo)
                LabelView(name: .before, todo: $todo)
                LabelView(name: .after, todo: $todo)
            }
            .padding(.leading, 5)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    @State static var todo = Todo(title: "Study Swift", isDone: false)
    static var previews: some View {
        DetailView(todo: $todo)
    }
}
