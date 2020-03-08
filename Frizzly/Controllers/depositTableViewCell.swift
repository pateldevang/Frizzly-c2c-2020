//
//  depositTableViewCell.swift
//  Frizzly
//
//  Created by Devang Patel on 08/03/20.
//  Copyright © 2020 Devang Patel. All rights reserved.
//

import UIKit

class depositTableViewCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nametext: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
