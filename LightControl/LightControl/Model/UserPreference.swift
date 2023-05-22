//
//  UserPreference.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/8.
//

import Foundation

class UserPreference {
    static let shared = UserPreference()
    
    private let userPreference: UserDefaults
    private init() {
        userPreference = UserDefaults.standard
    }
    
    enum Preference: String {
        case lastPeripheral
    }
    
    var lastPeripheral: String {
        get { return userPreference.string(forKey: Preference.lastPeripheral.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: Preference.lastPeripheral.rawValue) }
    }
}
