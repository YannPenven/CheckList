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
    
    enum NSCodingKeys {
        static let Text = "text"
        static let Checklist = "checklist"
        static let IconName = "iconName"
    }
    
    //MARK: init method
    
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
    
    
    //MARK: Encode & Decode method
    
    required convenience init?(coder decoder: NSCoder) {
        guard let text = decoder.decodeObject(forKey: NSCodingKeys.Text) as? String,
            let item = decoder.decodeObject(forKey: NSCodingKeys.Checklist) as? [ChecklistItem],
            let iconName = decoder.decodeObject(forKey: NSCodingKeys.IconName) as? String
            else { return nil }
        
        self.init(
            txt: text,
            item: item,
            iconName: iconName
        )
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.text, forKey: NSCodingKeys.Text)
        aCoder.encode(self.item, forKey: NSCodingKeys.Checklist)
        aCoder.encode(self.iconName, forKey: NSCodingKeys.IconName)
    }

}
