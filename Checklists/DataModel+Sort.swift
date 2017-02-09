//
//  DataModel+Sort.swift
//  Checklists
//
//  Created by iem on 09/02/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

extension DataModel {
    func sortChecklists(){
        self.list = self.list.sorted(by: { $0.text < $1.text })
    }
}
