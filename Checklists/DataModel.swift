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
        sortChecklists()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(DataModel.saveChecklist), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    
    //MARK: variable
    var list: [Checklist]
}
