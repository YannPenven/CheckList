//
//  ChecklistItem.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text:String
    var checked:Bool
    
    init(txt:String, checked:Bool) {
        self.text = txt
        self.checked = checked
    }
    
    init(txt:String) {
        self.text = txt
        self.checked = false
    }
    
    func toggleChecked(){
        self.checked = !self.checked
    }
}
