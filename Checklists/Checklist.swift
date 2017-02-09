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
    var item = [ChecklistItem]()
    
    init(txt:String) {
        self.text = txt
    }
    
    init(txt:String, item:[ChecklistItem]) {
        self.text = txt
        self.item = item
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let text = decoder.decodeObject(forKey: "text") as? String,
            let item = decoder.decodeObject(forKey: "checklist") as? [ChecklistItem]
            else { return nil }
        
        self.init(
            txt: text,
            item: item
        )
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.text, forKey: "text")
        aCoder.encode(self.item, forKey: "checklist")
    }

}
