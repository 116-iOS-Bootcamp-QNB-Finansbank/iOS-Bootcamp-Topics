//
//  MyComponent.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 19.09.2021.
//

import Foundation

class MyComponent: Codable {
    var indice: Int = 3
    
    static let instance = MyComponent()
}

class SomeClass {
    func someFunc() {
        let myComponent = MyComponent.instance
        myComponent.indice = 2
        
        let myComponent2 = MyComponent.instance
        
    }
    
    
    
}
