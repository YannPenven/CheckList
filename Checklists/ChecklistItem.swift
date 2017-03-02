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
    var dueDate: Date = Date.init()
    var shouldRemind: Bool = false
    var itemID: Int = 0
    
    enum NSCodingKeys {
        static let Text = "text"
        static let Checked = "checked"
        static let dueDate = "dueDate"
        static let shouldRemind = "shouldRemind"
    }
    
    init(txt:String, checked:Bool, shouldRemind:Bool, dueDate: Date) {
        self.text = txt
        self.checked = checked
    }
    
    init(txt:String) {
        self.text = txt
        self.checked = false
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let text = decoder.decodeObject(forKey: NSCodingKeys.Text) as? String,
                let dueDate = decoder.decodeObject(forKey: NSCodingKeys.dueDate) as? Date
            else { return nil }
        
        self.init(
            txt: text,
            checked: decoder.decodeBool(forKey: NSCodingKeys.Checked),
            shouldRemind: decoder.decodeBool(forKey: NSCodingKeys.shouldRemind),
            dueDate: dueDate
        )
    }
    
    func toggleChecked(){
        self.checked = !self.checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.text, forKey: NSCodingKeys.Text)
        aCoder.encode(self.checked, forKey: NSCodingKeys.Checked)
        aCoder.encode(self.dueDate, forKey: NSCodingKeys.dueDate)
        aCoder.encode(self.shouldRemind, forKey: NSCodingKeys.shouldRemind)
    }
}
