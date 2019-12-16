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
                .font(.system(size: 40, weight: .heavy, design: .default))
            Divider()
            Text("Label")
                .font(.title)
                .fontWeight(.bold)
            LabelList
            Spacer()
        }
    }
    
    var LabelList: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack{
                LabelView(name: .important)
                LabelView(name: .optional)
                LabelView(name: .time)
                LabelView(name: .before)
                LabelView(name: .after)
            }.padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    @State static var todo = Todo(title: "Study Swift", isDone: false)
    static var previews: some View {
        DetailView(todo: $todo)
    }
}
