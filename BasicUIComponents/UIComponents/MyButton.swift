//
//  MyButton.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class MyButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setTitleColor(.red, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
    }
}

/*
class MySuperClass {
    func abc() {
        print("abc")
    }
}

class MySubClass: MySuperClass {
    override func abc() {
        
        print("cdf")
        
        super.abc()
    }
}

*/
