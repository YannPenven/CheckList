//
//  ChecklistViewController+SaveLoad.swift
//  Checklists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension DataModel {
    func documentDirectory() -> URL {
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func dataFileUrl() -> URL  {
        return documentDirectory().appendingPathComponent("Checklist.plist")
    }
    
    @objc func saveChecklist(){
        NSKeyedArchiver.archiveRootObject(self.list, toFile: dataFileUrl().path)
    }
    
    func loadChecklist(){
        if let list = (NSKeyedUnarchiver.unarchiveObject(withFile: dataFileUrl().path) as? [Checklist]){
            self.list = list
        }
    }
}
