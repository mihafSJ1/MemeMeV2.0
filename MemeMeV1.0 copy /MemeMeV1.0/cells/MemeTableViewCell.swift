//
//  memeTableViewCell.swift
//  MemeMeV1.0
//
//  Created by Mihaf on 14/10/1441 AH.
//  Copyright © 1441 udacity. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {

    @IBOutlet weak var memeTitle: UILabel!
    
    @IBOutlet weak var memeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
