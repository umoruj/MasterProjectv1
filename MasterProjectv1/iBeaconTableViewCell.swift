//
//  iBeaconTableViewCell.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 12/15/15.
//  Copyright © 2015 Umoru Joseph. All rights reserved.
//

import UIKit

class iBeaconTableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var minorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
