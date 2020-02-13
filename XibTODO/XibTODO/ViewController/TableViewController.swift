//
//  ViewController.swift
//  XibTODO
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var todoTableView: UITableView!
  var todos: [Todo] = [Todo(title: "A"), Todo(title: "B"), Todo(title: "C"), Todo(title: "D"), Todo(title: "E"), Todo(title: "F")]

  override func viewDidLoad() {
    super.viewDidLoad()
    todoTableView.delegate = self
    todoTableView.dataSource = self

    let nibName = UINib(nibName: "TodoTableCell", bundle: nil)
    todoTableView.register(nibName, forCellReuseIdentifier: "todoCell")
  }

  required init?(coder: NSCoder) {
    suepr.init()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableCell", for: indexPath) as! TodoTableViewCell
    return cell
  }
}
