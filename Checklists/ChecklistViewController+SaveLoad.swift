//
//  ChecklistViewController+SaveLoad.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension ChecklistViewController {
    func documentDirectory() -> URL {
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func dataFileUrl() -> URL  {
        return documentDirectory().appendingPathComponent("ChecklistItem.plist")
    }
    
    func saveChecklistItems(){
        NSKeyedArchiver.archiveRootObject(self.checklist, toFile: dataFileUrl().path)
    }
    
    func loadChecklistItems(){
        if let list = (NSKeyedUnarchiver.unarchiveObject(withFile: dataFileUrl().path) as? [ChecklistItem]){
            self.checklist = list
        }
    }
}
