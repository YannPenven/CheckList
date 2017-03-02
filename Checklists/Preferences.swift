//
//  Preferences.swift
//  Checklists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

class Preferences {
    static let sharedInstance = Preferences()
    
    let standard = UserDefaults.standard

    enum NSPreferencesKey {
        static let ChecklistItemID = "ChecklistItemID"
    }
    
    private init() {
        
    }
    
    var firstLaunch: Bool {
        get{
            if !standard.bool(forKey: "FirstLaunch"){
                standard.set(true, forKey: "FirstLaunch")
                DataModel.sharedInstance.initOnFirstLaunch()
                return true
            }
            return false
        }
    }
    
    func nextChecklistItemID() -> Int {
        var itemID = standard.integer(forKey: NSPreferencesKey.ChecklistItemID)
        itemID += 1
        standard.set(itemID, forKey: NSPreferencesKey.ChecklistItemID)
        return itemID
    }
}
