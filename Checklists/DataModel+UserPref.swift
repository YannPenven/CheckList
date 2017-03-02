//
//  DataModel+UserPref.swift
//  Checklists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import UIKit

extension DataModel {
    func initOnFirstLaunch(){
        self.list.append(Checklist(txt: "List", item: [ChecklistItem(txt: "Edit your first item"),ChecklistItem(txt: "Swipe to delete")], iconName: "Folder"))
    }
}
