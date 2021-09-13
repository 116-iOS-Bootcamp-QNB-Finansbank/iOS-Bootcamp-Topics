//
//  CustomTableViewCell.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 12.09.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
