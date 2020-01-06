//
//  ContentView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/13.
//  Copyright © 2019 motivatin. All rights reserved.

import Firebase
import SwiftUI

struct TodoListView: View {
  let db = Firestore.firestore()
  let defaultTodo = Todo(title: "Enter the title", isDone: false)

  var ref: DocumentReference?
  @State var todos: [Todo] = []

  init() {
    ref = db.collection("todo").addDocument(data: [
        "title": "Jsceno Issue #75",
        "isDone": false,
        "date": Date()
    ]) { err in
        if let err = err {
            print("Error adding document: \(err)")
        } else {
            print("Document added")
        }
    }
  }

  var body: some View {
    NavigationView {
      List(todos.indices, id: \.self) { index in
        NavigationLink(destination: DetailView(todo: self.$todos[index])) {
          TodoRow(todo: self.$todos[index])
        }
      }
      .navigationBarTitle("오늘 할 일")
      .navigationBarItems(trailing: Button(action: { self.didTapAddButton() }) {
        Image(systemName: "plus")
          .foregroundColor(.white)
      })
    }
  }

  func didTapAddButton() {
    todos.append(defaultTodo)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
  }
}
