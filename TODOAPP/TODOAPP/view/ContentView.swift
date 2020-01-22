//
//  ContentView.swift
//  TODOAPP
//
//  Created by Choi on 2019/12/13.
//  Copyright © 2019 motivatin. All rights reserved.

import Firebase
import SwiftUI

struct TodoListView: View {
  @ObservedObject var contentViewModel: ContentViewModel

  var body: some View {
    NavigationView {
      List(contentViewModel.todos.indices, id: \.self) { index in
        NavigationLink(destination: DetailView(todo: self.$contentViewModel.todos[index])) {
          TodoRow(todo: self.$contentViewModel.todos[index])
        }
      }
      .onAppear {
        self.contentViewModel.getTodoItems()
      }
      .navigationBarTitle("오늘 할 일")
      .navigationBarItems(trailing: Button(action: { self.contentViewModel.didTapAddButton() }) {
        Image(systemName: "plus")
          .foregroundColor(.black)
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView(contentViewModel: ContentViewModel())
  }
}
