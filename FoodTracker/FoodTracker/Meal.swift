//
//  Meal.swift
//  FoodTracker
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import UIKit

class Meal {
  var name: String
  var photo: UIImage?
  var rating: Int

  init?(name: String, photo: UIImage?, rating: Int) {
    if name.isEmpty || rating < 0 {
      return nil
    }

    self.name = name
    self.photo = photo
    self.rating = rating
  }
}
