//
//  ContentViewModel.swift
//  TODOAPP
//
//  Created by Choi on 2020/01/22.
//  Copyright © 2020 motivatin. All rights reserved.
//

import Foundation
import Firebase

class ContentViewModel: ObservableObject {
  let db = Firestore.firestore()
  let defaultTodo = Todo(title: "Enter the title", isDone: false)
  var ref: DocumentReference? = nil
  @Published var todos: [Todo] = []
  
  func didTapAddButton() {
    ref = db.collection("todos").addDocument(data: [
      "title": defaultTodo.title,
      "isDone": defaultTodo.isDone,
    ]) { err in
      if let err = err {
        print("Error adding document: \(err)")
      } else {
        print("Success")
      }
    }
  }

  func getTodoItems() {
    db.collection("todos")
      .getDocuments { querySnapshot, err in
      if let err = err {
        print("================")
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          print("================")
          self.todos.append(Todo(title: document.get("title") as! String, isDone: document.get("isDone") != nil))
          print("\(document.documentID) => \(document.data())")
        }
      }
    }
  }
}
