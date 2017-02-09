//
//  DataModel.swift
//  Checklists
//
//  Created by iem on 09/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

class DataModel {
    static let sharedInstance = DataModel()
    private init() {
        self.list = [Checklist]()
        loadChecklist()
    }
    
    //MARK: variable
    var list: [Checklist]
}
