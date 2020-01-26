//
//  ContentViewModel.swift
//  TODOAPP
//
//  Created by Choi on 2020/01/22.
//  Copyright © 2020 motivatin. All rights reserved.
//

import Firebase
import Foundation

class ContentViewModel: ObservableObject {
  let db = Firestore.firestore()
  let defaultTodo = Todo(title: "Enter the title", isDone: false)
  var ref: DocumentReference?
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
    var listener: ListenerRegistration?
    listener = db.collection("todos")
      .addSnapshotListener { querySnapshot, err in
        listener?.remove()

        if let err = err {
          print("================")
          print("Error getting documents: \(err)")
        } else {
          _ = querySnapshot!.documents.map {
            let data = $0.data()
            self.todos.append(
              Todo(title: data["title"] as? String ?? "Untitled",
                   isDone: data["isDone"] as? Bool ?? false)
            )
            print("Data: \(data)")
          }
        }
      }
  }
}
