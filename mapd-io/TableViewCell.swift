//
//  TableViewCell.swift
//  mapd-io
//
//  Created by Hunt, Alan on 4/20/20.
//  Copyright © 2020 Josh Tully. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var startTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
