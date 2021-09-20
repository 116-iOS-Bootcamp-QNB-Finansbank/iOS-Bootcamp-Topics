//
//  UserDefaultsManager.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 19.09.2021.
//

import Foundation

enum UserDefaultKeys: String {
    case hasCameBefore = "hasCameBefore"
}

//protocol MyUserDefaultsProtocol {
//    var hasCameBefore: Bool { get set }
//}

class MyUserDefaults { //}: MyUserDefaultsProtocol {
    static let instance = MyUserDefaults()
    
    var hasCameBefore: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultKeys.hasCameBefore.rawValue)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaultKeys.hasCameBefore.rawValue)
        }
    }
}
