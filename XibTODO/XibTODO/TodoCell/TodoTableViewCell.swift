//
//  TodoTableViewCell.swift
//  XibTODO
//
//  Created by Choi on 2020/02/13.
//  Copyright © 2020 Choi. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

  @IBOutlet weak var todoTableCell: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
