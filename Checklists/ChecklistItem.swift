//
//  ChecklistItem.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
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
    
    required convenience init?(coder decoder: NSCoder) {
        guard let text = decoder.decodeObject(forKey: "text") as? String
            else { return nil }
        
        self.init(
            txt: text,
            checked: decoder.decodeBool(forKey: "checked")
        )
    }
    
    func toggleChecked(){
        self.checked = !self.checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.text, forKey: "text")
        aCoder.encode(self.checked, forKey: "checked")
    }
}
