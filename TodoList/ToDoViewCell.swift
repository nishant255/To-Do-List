//
//  ToDoViewCell.swift
//  TodoList
//
//  Created by Nishant Patel on 3/20/17.
//  Copyright © 2017 Nishant Patel. All rights reserved.
//

import UIKit

class ToDoViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
