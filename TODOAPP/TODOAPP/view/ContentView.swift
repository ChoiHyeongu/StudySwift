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
  @State var ref: DocumentReference? = nil
  @State var todos: [Todo] = []

  var body: some View {
    NavigationView {
      List(todos.indices, id: \.self) { index in
        NavigationLink(destination: DetailView(todo: self.$todos[index])) {
          TodoRow(todo: self.$todos[index])
        }
      }
      .onAppear{
        self.readDatabase()
      }
      .navigationBarTitle("오늘 할 일")
      .navigationBarItems(trailing: Button(action: { self.didTapAddButton() }) {
        Image(systemName: "plus")
          .foregroundColor(.black)
      })
    }
  }

  func didTapAddButton() {
    ref = db.collection("todos").addDocument(data: [
      "title": defaultTodo.title,
      "isDone": defaultTodo.isDone,
    ]) { err in
      if let err = err {
        print("Error adding document: \(err)")
      } else {
        print("Success")
        self.readDatabase()
      }
    }
  }

  func readDatabase() {
    db.collection("todos").getDocuments { querySnapshot, err in
      if let err = err {
        print("================")
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          print("================")
          self.todos.append(Todo(title: document.get("title") as! String, isDone: (document.get("isDone") != nil)))
          print("\(document.documentID) => \(document.data())")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
  }
}
