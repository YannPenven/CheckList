//
//  Date+Extention.swift
//  Checklists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 YannPenven. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
