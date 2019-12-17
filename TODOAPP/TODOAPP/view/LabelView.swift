//
//  LabelView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/16.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

enum Label: String{
    case important = "Important"
    case optional = "Optional"
    case time = "Time"
    case before = "Before"
    case after = "After"
    case none = ""
}

struct LabelView: View {
    var name: Label
    var color: Color
    @Binding var todo: Todo
    
    init(name: Label, todo: Binding<Todo>){
        self.name = name
        switch name {
        case .none:
            color = .white
        case .important:
            color = .red
        case .optional:
            color = .blue
        case .time:
            color = .green
        case .before:
            color = .orange
        case .after:
            color = .yellow
        }
        self._todo = todo
    }
    
    var body: some View {
        Button(action: {self.didTapLabelButton()}) {
            if(name != .none){
                Text(self.name.rawValue)
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
                    .frame(width: 80, height: 30, alignment: .center)
                    .background(self.color)
                    .cornerRadius(10)
            }
        }
    }
    
    func didTapLabelButton() { todo.label = name }
}

struct LabelView_Previews: PreviewProvider {
    @State static var todo = Todo(title: "Title", isDone: false)
    static var previews: some View {
        LabelView(name: .before, todo: $todo)
    }
}
