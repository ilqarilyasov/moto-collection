//
//  ThemeHelper.swift
//  MotoCollection
//
//  Created by Ilgar Ilyasov on 1/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        } else {
            setThemePreferenceToDark()
        }
    }
    
    let themePreferenceKey = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let value = UserDefaults.standard.string(forKey: themePreferenceKey)
        return value
    }
    
}
