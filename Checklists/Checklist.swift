//
//  Checklist.swift
//  Checklists
//
//  Created by iem on 09/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

class Checklist: NSObject, NSCoding {
    
    var text: String
    var item: [ChecklistItem]
    var uncheckedItemsCount: Int {
        get{
            return item.filter { (selectedItem : ChecklistItem) -> Bool in
                return !selectedItem.checked
                }.count
        }
    }
    var iconName: String
    
    init(txt:String) {
        self.text = txt
        item = [ChecklistItem]()
        self.iconName = "No Icon"
    }
    
    init(txt:String, item:[ChecklistItem], iconName: String) {
        self.text = txt
        self.item = item
        self.iconName = iconName
    }
    
    init(txt:String, iconName: String) {
        self.text = txt
        self.item = [ChecklistItem]()
        self.iconName = iconName
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let text = decoder.decodeObject(forKey: "text") as? String,
            let item = decoder.decodeObject(forKey: "checklist") as? [ChecklistItem],
            let iconName = decoder.decodeObject(forKey: "iconName") as? String
            else { return nil }
        
        self.init(
            txt: text,
            item: item,
            iconName: iconName
        )
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.text, forKey: "text")
        aCoder.encode(self.item, forKey: "checklist")
        aCoder.encode(self.iconName, forKey: "iconName")
    }

}
