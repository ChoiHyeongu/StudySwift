//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
