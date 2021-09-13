//
//  MyLabel.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class MyLabel: UILabel {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.textColor = .blue
        self.font = UIFont.systemFont(ofSize: 42)
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    

}
